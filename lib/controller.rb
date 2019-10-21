#require 'bundler'
#Bundler.require

require_relative 'gossip'

#la classe hérite de toutes les fonctionnalités de base de sinatra
class ApplicationController < Sinatra::Base

  get '/' do # = si qqun va à l'URL '/', fait ce qui suit (ici, cf index.erb)
  	erb :index, locals: {gossips: Gossip.all} #méthode locals permet d'envoyer au fichiers ERB des variables que l'on utilisera
	end



  get '/gossips/new/' do 
  	erb :new_gossip #renvoie au fichier new_gossip.erb
	end


	post '/gossips/new/' do
  	Gossip.new(params["gossip_author"], params["gossip_content"]).save #fait un nouveau gossip et le sauve (voir le .erb pour les params)
  	redirect '/'
	end




	get '/gossips/:id/' do
		id = params['id'] #pour pouvoir écrire ensuite find(id) et non find(params['id']
		Gossip.find(id)	

		erb :shower, locals: {gossips: Gossip.all} #on veut les variables de Gossip.all dans le fichier erb, pour pouvoir appeler l'auteur et le content
	end



	get '/gossips/:id/edit' do
		id = params['id'] #on définit id
		Gossip.find(id)	

	  erb :edit, locals: {gossips: Gossip.all} #renvoie à la page erb

	end

	post '/gossips/:id/edit' do
		id = params['id']
		Gossip.update(id)
	end

end



#SI ON A PAS DE DOC CONFIG.RUB :permet d’exécuter le code de la classe sans avoir à écrire un ApplicationController.new.perform en bas du fichier
#  run! if app_file == $0
#end