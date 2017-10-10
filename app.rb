require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :'pirates/index'
    end

     get '/new' do
      erb :'pirates/new'
    end

    get '/pirates' do
      erb :'pirates/show'
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
      
      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      @ships = Ship.all

      erb :'pirates/show'
    end
  end
end
