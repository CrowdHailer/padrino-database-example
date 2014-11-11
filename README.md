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
