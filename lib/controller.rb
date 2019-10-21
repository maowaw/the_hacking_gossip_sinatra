#require 'bundler'
#Bundler.require

require_relative 'gossip'

#la classe hérite de toutes les fonctionnalités de base de sinatra
class ApplicationController < Sinatra::Base

  get '/' do
  	erb :index, locals: {gossips: Gossip.all} #méthode locals permet d'envoyer au fichiers ERB des variables que l'on utilisera
	end


  get '/gossips/new/' do
  	erb :new_gossip
	end

	post '/gossips/new/' do
  	Gossip.new(params["gossip_author"], params["gossip_content"]).save
  	redirect '/'
	end



end



#SI ON A PAS DE DOC CONFIG.RUB :permet d’exécuter le code de la classe sans avoir à écrire un ApplicationController.new.perform en bas du fichier
#  run! if app_file == $0
#end