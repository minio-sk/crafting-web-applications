require 'rspec'
require 'nokogiri'

class Scraper < Struct.new(:downloader, :persistor)
  def scrape(id)
    html = downloader.download("http://www.statistics.sk/pls/wregis/detail?wxidorg=#{id}")

    doc = Nokogiri::HTML(html)

    subject = { original_id: id }
    doc.search('.tabid tr').each do |tr|
      tds = tr.search('td')
      case tds[0].text
        when 'IČO:' then
          subject[:ico] = tds[2].text
      end
    end

    persistor.save(subject)
  end
end

RSpec.describe Scraper do
  it 'scrapes based on id' do
    fixture = File.read(File.dirname(__FILE__) + '/fixtures/5.html', encoding: 'windows-1250')
    downloader = double(download: fixture)

    persistor = double.as_null_object

    scraper = Scraper.new(downloader, persistor)
    scraper.scrape(5)

    expect(persistor).to have_received(:save).with({
      ico: '00000426', original_id: 5
    })
  end
end
