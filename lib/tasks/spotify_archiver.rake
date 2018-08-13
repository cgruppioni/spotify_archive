namespace :spotify_archiver do
  desc 'Archive all of a user\'s playlists'
  task(:archive => :environment) do
    Archive.archive_playlists
    puts 'Done!'
  end
end