namespace :db do

  desc 'Fills the database with sample data'
  task populate: :environment do
    require 'ffaker'

    if Rails.env.production? && ENV['FORCE'] != 'true'
      puts "You shouldn't replace real data with random sample in production env. Aborting..."

      return
    end

    ActionMailer::Base.delivery_method = :test

    if ENV['TRUNCATE'] == 'true'
      puts 'Truncating the database'
      truncate_database!
    end

    puts 'Creating users'
    User.transaction { create_users }

    puts 'Creating categories'
    Category.transaction { create_categories }

    puts 'Creating decks'
    Deck.transaction { create_decks }

    puts 'Attach categories'
    Category.transaction { attach_categories }

    puts 'Creating cards'
    Card.transaction { create_cards }

    puts 'Creating subscriptions'
    Subscription.transaction { create_subscriptions }
  end

  private

  def create_users(count = 10)
    count.times { |index| create_user(index) }
  end

  def create_user(index = nil)
    User.create(
      first_name: FFaker::Name.first_name,
      last_name:  FFaker::Name.last_name,
      email:      "user#{index}@example.com",
      password:   'pass1024',
    )
  end

  def create_categories(count = 10)
    count.times { |index| create_category(index) }
  end

  def create_category(index = nil)
    Category.create(name: FFaker::Color.name)
  end

  def create_decks(count = 3)
    User.find_each do |user|
      count.times { |index| create_deck(user, index) }
    end
  end

  def create_deck(user, index = nil)
    user.authored_decks.create(name: FFaker::Lorem.sentence(0).chop, description: FFaker::Lorem.paragraph)
  end

  def create_cards(count = 50)
    Deck.find_each do |deck|
      count.times { |index| create_card(deck, index) }
    end
  end

  def create_card(deck, index = nil)
    deck.cards.create(front: "#{FFaker::Color.name} #{FFaker::Lorem.word}", back: "#{FFaker::Lorem.word} #{FFaker::Color.name}")
  end

  def create_subscriptions(count = 3)
    User.find_each do |user|
      count.times { |index| create_subscription(user, index) }
    end
  end

  def create_subscription(user, index = nil)
    decks = Deck.order('RANDOM()').take(1 + rand(5))

    decks.each do |deck|
      user.subscriptions.create(deck: deck)
    end
  end

  def attach_categories
    Deck.find_each do |deck|
      categories = Category.order('RANDOM()').take(1 + rand(5))

      deck.categories << categories
    end
  end

  def truncate_database!
    table_names = ActiveRecord::Base.connection.tables - ['schema_migrations']

    ActiveRecord::Base.connection.execute("TRUNCATE #{table_names.join(', ')} RESTART IDENTITY CASCADE;") if table_names.any?
  end
end