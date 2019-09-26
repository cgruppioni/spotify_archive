require 'service_test_case'

class GenreDownloaderTest < ServiceTestCase
  scenario 'Download all of an artist\'s genres' do
    local_artist = artist(:artist_1)
    genres = ['pop', 'hip hop']



    GenreDownloader.perform(local_artist, genres)
  end
end