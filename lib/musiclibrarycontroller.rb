require 'pry'
class MusicLibraryController
extend Concerns::Findable

  def initialize(path = "./db/mp3s")
    object = MusicImporter.new(path)
    object.import
  end

  def call
      until @user_input == "exit"
        puts "Welcome to your music library!"
        puts  "To list all of your songs, enter 'list songs'."
        puts  "To list all of the artists in your library, enter 'list artists'."
        puts  "To list all of the genres in your library, enter 'list genres'."
        puts  "To list all of the songs by a particular artist, enter 'list artist'."
        puts  "To list all of the songs of a particular genre, enter 'list genre'."
        puts  "To play a song, enter 'play song'."
        puts  "To quit, type 'exit'."
        puts  "What would you like to do?"
        @user_input = gets.chomp.downcase
          case @user_input
          when "list songs"
            list_songs
          when "list artists"
            list_artists
          when "list genres"
            list_genres
          when "list artist"
            list_artist
          when "list genre"
            list_genre
          when "play song"
            play_song
          else
            call
          end
      end
  end

  def list_songs
  #  Song.all.sort {|a, b| a.name <=> b.name}.each.with_index do |song, i|
  #    puts "#{i(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  #  end
  # end
    @all_songs = Song.all
    all_songs_by_name = @all_songs.sort_by do {|song| song.name}
      all_songs_by_name.each_with_index do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
#     # binding.pry
  def list_artists
   Artist.all.sort {|a, b| a.name <=> b.name}.each.with_index do |name, i|
     puts "#{i}. #{song.artist.name}"
    end
  end

  def list_genres

  end

  def list_songs_by_artist

  end

  def list_songs_by_genre

  end

  def play_song

  end

end
