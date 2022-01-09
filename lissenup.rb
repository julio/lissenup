require 'rspotify'
require 'yaml'

config = YAML.load_file('config.yml')
RSpotify.authenticate(config["spotify"]["client_id"], config["spotify"]["client_secret"])

exit(0) if ARGV.length == 0

def albums_print(album_name)
  albums = RSpotify::Album.search(album_name)

  albums.each do |album|
    puts "#{album.name} : #{album.external_urls['spotify']}"
  end
end

albums_print(ARGV[0])