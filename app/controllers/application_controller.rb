class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end 

  get '/recipes/new' do 
    erb :index
  end 
  
  post '/recipes/new' do 
    @recipes = Recipe.all(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time]) 
    @recipes.save 
  end 
end
