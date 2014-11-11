class Article < Sequel::Model(:articles)
	def self.all_available
		published_articles.all
	end

	def self.available_page(page_number=1)
		published.limit(10, (page_number-1)*10).all
	end

	private

	def self.published_articles
		where(:published?).order(:headline)
	end
end