class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    #params = {"name"=>"Hello", "artist"=>"Adele", "button"=>""}
    @song = Song.create(name: params[:name])
  #  binding.pry
    #create new instance of artist from params[:artist] and associate to new song instance
    if @song.artist_id.nil?
      new_artist = Artist.create(name: params[:artist])
      @song.artist = new_artist
    end
    redirect '/songs/:slug'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
