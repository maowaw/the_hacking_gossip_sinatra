class Gossip

attr_accessor :author, :content

	def initialize (author, content)

		@author = author
		@content = content

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

end

