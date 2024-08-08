namespace :db do
    desc "Load the seed data from db/seeds.rb"
    task seed: :environment do
      load File.join(Rails.root, 'db', 'seeds.rb')
    end
  end
  