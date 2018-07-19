#Dir[File.join(__dir__, '/../app', '*.rb')].each { |file| load file }

Dir[File.dirname(__FILE__) + '/../app/*.rb'].each {|file| require file }

puts Scrapper.new
