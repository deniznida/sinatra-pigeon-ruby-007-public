class PigeonsController < ApplicationController

  get '/pigeons' do 
    @pigeons = Pigeon.all
    erb :'pigeons/index'
  end

  post '/pigeons' do
    @pigeon = Pigeon.new
    @pigeon.name = params["name"]
    @pigeon.gender = params["gender"]
    @pigeon.color = params["color"]
    @pigeon.lives = params["lives"]
    @pigeon.save
    redirect '/pigeons'
  end

  get '/pigeons/new' do
    erb :'pigeons/new'
  end

  get '/pigeons/:id/edit' do
    @pigeon = Pigeon.find(params[:id])
    erb :'pigeons/show'
  end

  get '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    erb :'pigeons/show'
  end

  patch '/pigeons/:id/update' do
    @pigeon = Pigeon.find(params[:id])
    @pigeon.update(name: params["name"], gender: params["gender"], color: params["color"], lives: params["lives"])
    redirect '/pigeons'
  end

  post '/pigeons/:id/destroy' do
    @pigeon = Pigeon.find(params[:id])
    @pigeon.destroy
    redirect '/pigeons'
  end
  

end