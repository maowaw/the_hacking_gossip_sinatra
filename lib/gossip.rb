class Gossip

attr_accessor :author, :content, :id 



	def initialize (author, content)

		@author = author
		@content = content
		@id = id

	end


	def save

	 CSV.open("./db/gossip.csv", "ab") do |csv| #ab = mode écriture
	    csv << [@author, @content]
	  end

	end



#cette méthode va récupérer chacune des lignes de notre CSV, en fait un objet Gossip avec son author et content puis ressort un array avec tous nos potins.
	def self.all

		all_gossips = [] #on initialise un array vide

	  CSV.read("./db/gossip.csv").each do |csv_line|
	    all_gossips << Gossip.new(csv_line[0], csv_line[1])
	  end

  return all_gossips #on retourne un array rempli d'objets Gossip

	end



	def self.find(id)
#appelle la def all pour recup le tableau all_gossips, à l'indice id
		return [self.all[id.to_i].author , self.all[id.to_i].content].join " a écrit : "

	end


#modifie un potin (on met un self pour chopper le tableau avec la fonction all)
	def self.update(index)

    all.each_with_index do |gossip, i|
      if index-1 == i # si l'id correspond au numéro de ligne on modifie l'index du tableau
        all_gossips[i] = Gossip.new(@author, @content)
      end
    end

    CSV.open("db/gossip.csv", "wb") do |csv| # réécriture tout le csv à partir du tableau modifié
      all_gossips.each do |gossip|
        csv << [gossip.author, gossip.content]
      end
    end


	end


end

