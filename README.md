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