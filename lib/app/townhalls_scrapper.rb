require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Scrapper
  attr_accessor :data_list

  def initialize
    @data_list = get_the_townhalls_info(get_the_townhalls_url(get_the_departments))
  end

  def get_the_departments
    url_list = []
    doc = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/"))
    url_list << doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[23]/td[1]/a')[0]['href']
    url_list << doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[5]/td[2]/a')[0]['href']
    url_list << doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[7]/td[3]/a')[0]['href']
    return url_list
  end

  def get_the_townhalls_url(urls)
    url_list = []
    urls.each do |url|
      doc = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/#{url}"))
      doc.xpath('//a[@class="lientxt"]').each do |node|
    	  url_list << node['href']
    	end
    end
    return url_list
  end

  def get_the_townhalls_info(urls)
    list = []
    urls.each do |url|
      hash ={}
      doc = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/#{url}"))
      hash[:name] = doc.xpath('/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a').text
      hash[:code_insee] = doc.xpath('/html/body/div/main/section[3]/div/table/tbody/tr[1]/td[2]').text
      hash[:email] = doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
      list << hash
    end
    return list
  end
end
