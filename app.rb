require 'sinatra'
require_relative 'isbn.rb'
require 'csv'


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
    p "this is params in home #{params}"
    erb :home, locals: {tencheck: tencheck, threecheck: threecheck}
end

post '/home' do
    tencheck = params[:ten]
    threecheck = params[:thirteen]
    params[:isbn10] ? avalidation = params[:isbn10] : avalidation = ""
    params[:isbn13] ? bvalidation = params[:isbn13] : bvalidation = ""
    p "this is params in home post #{params}"
    redirect 'validation?isbn10=' + avalidation + "&isbn13=" + bvalidation + "&ten=" + tencheck + "&thirteen=" + threecheck
end

get "/validation" do
    tencheck = params[:ten]
    threecheck = params[:thirteen]
    avalidation = params[:isbn10]
    bvalidation = params[:isbn13]
    isbn10 = isbn10(avalidation)
    isbn13 = isbn13(bvalidation)
    p "this is params in val #{params}"
    erb :validation, locals: {isbn10: isbn10, isbn13: isbn13, tencheck: tencheck, threecheck: threecheck, avalidation: avalidation, bvalidation: bvalidation}
end