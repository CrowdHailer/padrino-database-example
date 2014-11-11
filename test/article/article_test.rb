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

	def test_article_should_default_be_un_published?
		article = create :article
		assert_equal false, article.published?
	end
end