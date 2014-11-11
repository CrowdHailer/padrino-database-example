require_relative '../test_config'

class ArticleTest < MiniTest::Test
	def test_can_have_a_body
		article = build :article
		assert_equal attributes_for(:article)[:body], article.body 
	end	

	def test_body_content_is_required
		assert_raises Sequel::NotNullConstraintViolation do
			create :article, body: nil
		end
	end

	def test_article_can_be_published
		article = build :article, :published
		assert article.published?, 'Article should be published'
	end

	def test_article_should_default_be_unpublished?
		article = create :article
		assert_equal false, article.published?
	end

	def test_article_should_have_a_headline
		article = build :article
		assert article.headline, 'Article should have headline'
	end

	def test_headlines_should_be_unique
		article = create :article
		assert_raises Sequel::UniqueConstraintViolation do
			forged_article = create :article, headline: article.headline
		end
	end

	def test_available_articles_should_not_include_unpublished_articles
		published = create :article, :published
		unpublished = create :article
		articles = Article.all_available
		assert_includes articles, published
		refute_includes articles, unpublished
	end

	def test_available_articles_are_returned_alphabetically
		article_B = create :article, :published, headline: 'Bananas, by Gorrillas'
		article_A = create :article, :published, headline: 'Avacados on Holiday'
		articles = Article.all_available
		assert_equal article_A, articles.first
		assert_equal article_B, articles.last
	end
end
