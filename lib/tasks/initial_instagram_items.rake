namespace :initial_instagram_items do
  desc "initial instagram items: after creating the database"
  task :initial_instagram_items => :environment do
    if InstagramItem::CONFIG_EXITS.present?
      puts "You're missing some config vars: #{InstagramItem::CONFIG_EXITS.join(', ')}"
      puts "Check out /setup for instructions on how to set them"
      next
    end

    max_timestamp = Time.zone.now
    number_of_pages = 20

    puts "fetching #{number_of_pages} page(s) from Instagram, starting at #{max_timestamp} and working backward"
    begin
      InstagramItem.instagram_items(max_timestamp: max_timestamp,
                                   max_number_of_pages: number_of_pages)
    rescue => e
      puts "Encountered an error when trying to fetch Instagram Item error: #{e.message} " 
    end

    puts "done"
  end
end
