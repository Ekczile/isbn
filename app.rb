require 'sinatra'
require_relative 'isbn.rb'
require 'csv'


get '/' do
    erb :landing
end

post '/landing' do
    params[:thirteen] ? threecheck = params[:thirteen] : threecheck = ""
    params[:ten] ? tencheck = params[:ten] : tencheck = ""
    params[:csvfile] ? csvcheck = params[:csvfile] : csvcheck = ""
    redirect 'home?ten=' + tencheck + '&thirteen=' + threecheck + '&csvfile=' + csvcheck
end

get '/home' do
    tencheck = params[:ten]
    threecheck = params[:thirteen]
    csvcheck = params[:csvfile]
    erb :home, locals: {tencheck: tencheck, threecheck: threecheck, csvcheck: csvcheck}
end

post '/home' do
    tencheck = params[:ten]
    threecheck = params[:thirteen]
    csvfile = params[:csvfile]
    params[:isbn10] ? avalidation = params[:isbn10] : avalidation = ""
    params[:isbn13] ? bvalidation = params[:isbn13] : bvalidation = ""
    params[:myFile] ? csvval = params[:myFile] : csvval = ""
    redirect 'validation?isbn10=' + avalidation + "&isbn13=" + bvalidation + "&ten=" + tencheck + "&thirteen=" + threecheck + '&csvfile=' + csvfile + '&myFile=' + csvval
end

get "/validation" do
    tencheck = params[:ten]
    threecheck = params[:thirteen]
    csvfile = params[:csvfile]
    avalidation = params[:isbn10]
    bvalidation = params[:isbn13]
    csvval = params[:myFile]
    isbn10 = isbn10(avalidation)
    isbn13 = isbn13(bvalidation)
    if csvval != ""
        validated = makefile(csvval)
    else
        validated = ""
    end
    erb :validation, locals: {isbn10: isbn10, isbn13: isbn13, tencheck: tencheck, threecheck: threecheck, avalidation: avalidation, bvalidation: bvalidation, csvfile: csvfile, csvval: csvval, validated: validated}
end