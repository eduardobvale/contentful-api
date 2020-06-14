# Contentful API

## Setup

* Setup credentials

The following environment variables are mandatory:
```bash
CONTENTFUL_ACCESS_TOKEN=
CONTENTFUL_SPACE_ID=
```

You can set them in a .env file in project's root directory.

* Install dependencies

```bash
bundle install
```

* Run tests

```bash
bundle exec rspec
```

* Run Server

```bash
bundle exec rails s
```

## Main concept
This project was made for an specific contentful account using the "Content Delivery API" it renders a list of recipes and a full recipe page. This is a Rails based application, but some modules were skipped since they would not be used (active-record, action-mailer, action-mailbox , action-text, active-storage, action-cable, webpack-install). I started with a very simple strategy and keep refactoring small pieces while writing tests.

## API Client
The first version was a direct call to contentful client using the gem 'contentful' from the ApplicationHelper directly to the controller, but this made testing very difficult. So I moved the client to a command service using the gem 'simple_command' and mapped entries results to a model 'Recipe' (ActiveModel).

## Recipe details
Since recipe description uses markdown, I included a markdown helper using the gem 'kramdown'.

## Testing
Calling contentful API for every test could result in a block or reach api rate limit, so I used VCR to replay http requests and avoid repetitive calls.
Only requests and views were tested and factory bot was used for fixtures.

## Possible improvements
- I used rails low level to cache requests for a week, I think it would be better to use contentful "Sync API" to manage modifications and removed entries.
- The client is inside RetrieveRecipes command, making it difficult to stub or even to build another command, I think its possible to move the client to another module and use dependency injection to resolve the issue.
- Caching can be improved by using Action, or Fragment caching.
