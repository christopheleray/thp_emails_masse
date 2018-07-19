require 'csv'
load 'townhalls_scrapper.rb'
require 'fileutils'
require 'tempfile'

class DBAdder
  def initialize
    prepare_csv
  end

  def prepare_csv
    data_base = File.dirname(__FILE__) + '/../../db/townhalls.csv'
    CSV.open(data_base, "a+") do |csv|
      csv << [:commune, :département, :email, :handles]
    end
  end

  def DBAdder.add_emails_to_csv
    data = Scrapper.new
    list = data.data_list
    data_base = File.dirname(__FILE__) + '/../../db/townhalls.csv'
    list.each do |hash|
      CSV.open(data_base, "a+") do |csv|
        csv << [hash[:name], hash[:code_insee], hash[:email]]
      end
    end
  end

  def DBAdder.add_twitter_handles_to_csv
    data =
    list = data.
    data_base = File.dirname(__FILE__) + '/../../db/townhalls.csv'
    temp = Tempfile.new('csv')
    for i in (0..list.length-1)
      CSV.open(temp, 'a+') do |temp_csv|
        CSV.foreach(data_base) do |original|
          temp_csv << original + [list[i]]
          i += 1
        end
      end
    end
    FileUtils.mv(temp, data_base, :force => true)
  end
end
