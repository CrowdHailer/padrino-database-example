Padrino Database Example
========================

## Overview
create blog with unique titles, published, tags, comments
dates and order

## Steps

1. Generate Project
	*select postgres, sequel and minitest*
	`$ padrino g project commentr -a postgres -d sequel -t minitest`

2. Failing test for article class
	*TDD might solve this through several steps but we know that we want to show persistance with postgres and sequel so will jump straight to that*

3. setup model
	1. *setup postgreSQL: beyond scope provide link*
	2. *create a test and development database `createdb commentr_test`*
	3. *create a migration, remember to include down migration*
	4. *Migrate up, rember to do for test and development enviroment `padrino rake sq:migrate:up RACK_ENV=test`*

4. Test article body is required
	*database constraints fail with errors. It is normally best to use a form to validate input and use database constraints as exceptional errors*

5. Migration to add null constraint on body column
	*Execute this migration with `RACK_ENV=test padrino rake sq:migrate:up`*
	*If this fails you may have existing entries with null values that cannot be migrated, reset the table `RACK_ENV=test padrino rake sq:migrate:auto`*

6. Test article can be published
	*Note setting value with symbol containing question mark. This gives ruby convention booleans*

7. Write migration for published column
	*Note table column may contain Qmark. set default value to false*

8. Test default value is set
	I want to write this test

	```ruby
	def test_article_should_default_be_un_published?
		article = Article.new
		assert_equal false, article.published?
	end
	```

	However if I do this the article is not from the database and so the default hasn't been set. Instead I should use article create. This will create try to create a database entry so I need to include a body.

9. Add Factory girl
	*Do not need to specify a value for published as db provides default*

10. Switch test for factory girl
	*Has good documentation, I find traits very useful.*
	*By default I make a factory with no traits valid then take away as needed in tests*

11. Test for unique headline
	*simply save one article then copy headline and try creating a new article*

12 Add Unique Headline to article
	*No headline is required all previous tests of body and published require a headline, add to factory*
	*Headlines must be unique so we use a factory girl sequence*
	*We are not clearing test database so we get headline clashes after running the tests once. Add to test config to make all tests roll back previous runnings will still exist so reset the database, This transaction patch I always add first*
