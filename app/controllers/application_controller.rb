class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #get '/' do
  #  erb :index
  #end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredient], :cook_time => params[:cook_time])
    redirect to "/recipe/#{@recipe.id}"
  end

  get '/recipes' do
    @recipes = Recipe.all
    #binding.pry
    erb :index
  end

end
