require_relative '../test_config'

class ArticleTest < MiniTest::Test
	def test_can_have_a_body
		test_content = 'Some content, maybe about penguins'
		article = Article.new body: test_content
		assert_equal test_content, article.body 
	end	
end