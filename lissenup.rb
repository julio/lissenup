require 'rspotify'
require 'yaml'

config = YAML.load_file('config.yml')
RSpotify.authenticate(config["spotify"]["client_id"], config["spotify"]["client_secret"])

albums = RSpotify::Album.search('the song remains the same')

albums.each do |album|
  puts album.name
  puts ''
  album.tracks.each do |track|
    puts track.name
  end
  puts '--'
end