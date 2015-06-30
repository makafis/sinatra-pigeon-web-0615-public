# create your PigeonsController here
# it should inherit from ApplicationController
class PigeonsController < ApplicationController
    

    get '/pigeons' do
      @pigeon = Pigeon.all
      # binding.pry
      erb :'pigeons/index'
    end
    
    get '/pigeons/new' do
      erb :'pigeons/new'
    end

    get '/pigeons/:id' do
      @pigeon = Pigeon.find(params[:id])
      erb :'pigeons/show'
    end

    get '/pigeons/:id/edit' do
      @pigeon = Pigeon.find(params[:id])
      erb :'pigeons/edit'
    end

    post '/pigeons' do
      new_pigeon = Pigeon.new
      new_pigeon.name = params[:name]
      new_pigeon.color = params[:color]
      new_pigeon.lives = params[:lives]
      new_pigeon.gender = params[:gender]
      new_pigeon.save
      redirect '/pigeons'
    end

    delete '/pigeons/:id' do |id| #not working
       @pigeon = Pigeon.find(id)
      @pigeon.destroy
      redirect '/pigeons'
    end

    patch '/pigeons/:id' do |id| #not working
      if params[:pigeon]
        Pigeon.update(id, params[:pigeon])
      else
        Pigeon.update(id, :name => params[:name], :color => params[:color], :lives => params[:lives], :gender => params[:gender])
      end
      redirect "/pigeons/#{id}"
    end

end