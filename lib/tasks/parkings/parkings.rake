require 'open-uri'
require 'pp'

task :fetch_parkings => :environment do
  flux = Nokogiri::XML(open('http://carto.strasmap.eu/store/data/module/parking_position.xml'))

  parkings = flux.xpath('//p').map do |p|
    {id: p['id'].to_i, x: p['x'].to_f, y: p['y'].to_f}
  end

  parkings = parkings.map do |p|
    lat, lng = `echo "#{p[:x]} #{p[:y]}" | cs2cs -f "%.6f" +init=epsg:27561 +to +init=epsg:4326`.split.slice(0, 2).reverse
    {id: p[:id], lat: lat.to_f, lng: lng.to_f}
  end

  pp parkings
end
