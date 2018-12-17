require 'sinatra'
require_relative 'isbn.rb'
require 'csv'


get '/' do
    erb :landing
end

post '/landing' do
    params[:threeten] ? isbncheck = params[:threeten] : isbncheck = ""
    params[:csvfile] ? csvcheck = params[:csvfile] : csvcheck = ""
    redirect 'home?threeten=' + isbncheck + '&csvfile=' + csvcheck
end

get '/home' do
    isbncheck = params[:threeten]
    threecheck = params[:thirteen]
    csvcheck = params[:csvfile]
    erb :home, locals: {isbncheck: isbncheck, csvcheck: csvcheck}
end

post '/home' do
    isbncheck = params[:threeten]
    csvfile = params[:csvfile]
    params[:isbn] ? avalidation = params[:isbn] : avalidation = ""
    params[:myFile] ? csvval = params[:myFile] : csvval = ""
    redirect 'validation?isbn=' + avalidation + "&threeten=" + isbncheck + '&csvfile=' + csvfile + '&myFile=' + csvval
end

get "/validation" do
    isbncheck = params[:threeten]
    
    avalidation = params[:isbn]
    if avalidation.length == 10
        avalidation = avalidation + " is " + isbn10(avalidation)
    else
        avalidation = avalidation + " is " + isbn13(avalidation)
    end
    csvval = params[:myFile]
    csvfile = params[:csvfile]
    if csvfile != ""
        validated = makefile(csvval)
    else
        validated = ""
    end
    erb :validation, locals: {isbncheck: isbncheck, avalidation: avalidation, csvfile: csvfile, csvval: csvval, validated: validated}
end