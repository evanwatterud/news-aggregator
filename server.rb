require "sinatra"
require "pry"
require 'csv'

get "/" do
  erb :index
end

get "/articles/new" do
  erb :new
end

get "/articles" do
  @articles = CSV.read("articles.csv")
  erb :articles
end

post "/articles" do
  title = params['title']
  url = params['url']
  description = params['description']

  CSV.open("articles.csv", "a+") do |csv|
    csv << [title, url, description]
  end

  redirect "/articles/new"
end
