class Article < Sequel::Model(:articles)
	def self.all_available
		where(:published?).order(:headline).all
	end
end