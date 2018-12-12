require 'sinatra'
require_relative 'isbn.rb'


get '/' do
    erb :landing
end

post '/landing' do
    params[:thirteen] ? threecheck = params[:thirteen] : threecheck = ""
    params[:ten] ? tencheck = params[:ten] : tencheck = ""
    redirect 'home?ten=' + tencheck + '&thirteen=' + threecheck
end

get '/home' do
    tencheck = params[:ten]
    threecheck = params[:thirteen]
    erb :home, locals: {tencheck: tencheck, threecheck: threecheck}
end

post '/home' do
    params[:isbn10] ? avalidation = params[:isbn10] : avalidation = ""
    params[:isbn13] ? bvalidation = params[:isbn13] : bvalidation = ""
    redirect 'validation?isbn10=' + avalidation + "&isbn13=" + bvalidation
end

get "/validation" do
    avalidation = params[:isbn10]
    bvalidation = params[:isbn13]
    isbn10 = isbn10(avalidation)
    isbn13 = isbn13(bvalidation)
    erb :validation, locals: {isbn10: isbn10, isbn13: isbn13}
end