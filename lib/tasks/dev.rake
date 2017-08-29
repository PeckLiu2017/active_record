desc "Task description"
namespace :dev do
  task :generate_clients => :environment do
    1000.times do |i|
      Client.create!(
        :name => Faker::Cat.name,
        :telephone =>
          ["158","181","136"].sample +
          rand(10).to_s +
          rand(10).to_s +
          rand(10).to_s +
          rand(10).to_s +
          rand(10).to_s +
          rand(10).to_s +
          rand(10).to_s +
          rand(10).to_s
      )
      puts "Generate Client #{i}"
    end
    # Client.find_each do |client|
    #   client.update(:role_id => Role.pluck(:id).sample)
    # end
  end

  task :generate_orders => :environment do
    1000.times do |i|
      Order.create!(
        :product => Faker::Book.title,
        :price => rand(20..200),
        :quantity => rand(1000),
        :client_id => Client.pluck(:id).sample
      )
      puts "Generate Order #{i}"
    end

    Order.find_each do |order|
      order.update(:total_price => order.price * order.quantity)
    end

    Order.find_each{ |order| order.update(:status => ['paid','cancled'].sample) }
  end

  task :generate_roles => :environment do
    1000.times do |i|
      Role.create!(
        :client_id => Client.pluck(:id).sample,
        :info => ["VIP","general customers"].sample
      )
      puts "Generate Role #{i}"
    end

    Role.find_each do |role|
      role.update(:client_id => Client.pluck(:id).sample)
    end

    Client.find_each do |client|
      client.update(:role_id => Role.pluck(:id).sample)
    end
  end

  task :generate_addresses => :environment do
    1000.times do |i|
      Address.create!(
        :client_id => Client.pluck(:id).sample,
        :country => Faker::Address.country,
        :province => Faker::Address.state,
        :city => Faker::Address.city,
        :county => Faker::Address.street_name
      )
      puts "Generate Address #{i}"
    end
  end

  task :generate_users_and_articles => :environment do
    1000.times do |i|
      User.create!(
        :username => Faker::Name.name ,
        :password => Faker::Number.number(10),
      )
      Article.create!(
        :user_id  => User.last.id,
        :title => Faker::Lorem.word,
        :summary => Faker::Lorem.sentences(1),
        :text => Faker::Lorem.paragraph,
      )
      puts "Generate user_and_article #{i}"
    end
  end

  task :generate_comments => :environment do
    1000.times do |i|
      Comment.create!(
        :article_id => Article.pluck(:id).sample,
        :title => Faker::Lorem.word,
        :paragraph => Faker::Lorem.paragraph,
      )
      puts "Generate Comment #{i}"
    end
  end

  task :generate_picturefiles => :environment do
    1000.times do |i|
      PictureFile.create!(
        :filepath => Faker::Internet.url,
        :filename => Faker::Lorem.word,
        :fileinfo => Faker::Lorem.paragraph,
      )
      puts "Generate PictureFile #{i}"
    end
  end

  task :generate_authors_and_books => :environment do
    1000.times do |i|
      Author.create!(
        :name => Faker::Friends.character,
        :email => Faker::Internet.free_email,
        :address => Faker::Address.state + Faker::Address.city + Faker::Address.street_address,
      )
      Book.create!(
        :author_id => Author.last.id,
        :name => Faker::Book.title,
        :published_at => Time.now - rand(20).years - rand(12).months - rand(365).days,
        # :info => Faker::Lorem.sentence
      )
      puts "Generate author and books #{i}"
    end
  end

  task :generate_suppliers_and_accounts => :environment do
    1000.times do |i|
      Supplier.create!(
        :name => Faker::Friends.character,
      )
      Account.create!(
        :supplier_id => Supplier.last.id,
        :account_number => Faker::Number.number(10),
        # :info => Faker::Lorem.sentence
      )
      puts "Generate suppliers and accounts #{i}"
    end
  end

  task :generate_documents_sections_and_paragraphs => :environment do
    1000.times do |i|
      Document.create!(
        :name => Faker::Lorem.word,
      )
      Section.create!(
        :document_id => Document.last.id,
        :content => Faker::Lorem.paragraph,
      )
      Paragraph.create!(
        :section_id => Section.last.id,
        :content => Faker::Lorem.paragraph
      )
      puts "Generate documents sections and paragraphs #{i}"
    end
  end

  # Client.find_each do |client|
  #   client.update!(:orders_count => client.orders.count)
  # end
end
