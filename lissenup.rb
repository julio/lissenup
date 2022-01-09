require 'rspotify'
require 'yaml'

config = YAML.load_file('config.yml')
RSpotify.authenticate(config["spotify"]["client_id"], config["spotify"]["client_secret"])

exit(0) if ARGV.length == 0

albums = RSpotify::Album.search(ARGV[0])
albums.each do |album|
  puts "#{album.name} : #{album.external_urls['spotify']}"
end