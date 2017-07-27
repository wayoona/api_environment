namespace :dev do
  task :fetch_city => :environment do
    puts "Fetch city data..."
    response = RestClient.get "http://web.juhe.cn:8080/environment/air/pmCities", :params => { :key => "cffd9f472a295d5da4ea4c3b30fd2d66" }
    data = JSON.parse(response.body)

    data["result"].each do |c|
      existing_environment = Environment.find_by_name( c["name"] )
      if existing_environment.nil?
        Environment.create!(:name => c["name"],
                      :pinyin => c["pinyin"] )
      end
    end

    puts "Total: #{Environment.count} environments"
  end
end
