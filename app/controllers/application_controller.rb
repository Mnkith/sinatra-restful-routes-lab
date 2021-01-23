class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @all = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  
  get '/recipes/:id/edit' do 
    @r = Recipe.find(params[:id])
    erb :edit
  end
  
  patch '/recipes/:id' do 
    @r = Recipe.find(params[:id])
    @r.name = params[:name]
    @r.ingredients = params[:ingredients]
    @r.cook_time = params[:cook_time]
    @r.save
    # binding.pry
    redirect "/recipes/#{@r.id}"
  end
  

  post '/recipes' do
    @r = Recipe.create(params)
    # binding.pry
    redirect "/recipes/#{@r.id}"
  end
  
  get '/recipes/:id' do
    @r = Recipe.find(params[:id])
    erb :show
  end

  delete '/recipes/:id' do #delete action
    @r = Recipe.find_by_id(params[:id])
    @r.delete
    redirect to '/articles'
  end 
  
end
