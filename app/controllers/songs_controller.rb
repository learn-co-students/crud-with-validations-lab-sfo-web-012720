class SongsController < ApplicationController
    def index
        @songs=Song.all
    end

    def show
        @song = Song.find(params:[id])
    end

    def new
        @song = Song.new
    end

    def edit
        @song = Song.find(params[:id])
    end

    def create
        @song = Song.new(song_params)
        if @song.update(song_params)
            redirect_to @song
        else
            render :new
        end
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(song_params)
            redirect_to @song
        else
            render :edit
        end
    end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy 
        redirect_to songs_url
    end

    def song_params
        params.require(:song).permit(:title, :released, :genre, :artist_name)
    end
end
