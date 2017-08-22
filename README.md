### Intro

I wanted to persist _something_ to the database to make this application a little bit more fun.  We could have gotten away with taking parameters, crafting an HTTP request, and parsing the result but I wanted to make it a little more interesting and feature-rich.

### Setup

```
git clone git@github.com:mzemel/event_stream.git
cd event_stream
bundle install
bundle exec rake db:create db:migrate
bundle exec rake db:seed
bundle exec rspec
```

Visit [localhost:3000](http://localhost:3000) for Swagger docs.

### Wins

1. You can search for historical requests made for an owner, a repo, or by event type.
2. You can quickly replay old requests using the EventRequestRetriever service object.
3. We can create different views of an EventRequest: a simplified (local) view which can provide IDs for hyperlinking in the front-end, and a detailed view which hits the GitHub API and organizes the desired presentation.

### Cool technologies

1. JSON-Schema, to write desired API response shapes and use them to TDD the controllers and other code.
2. VCR, for capturing and playing with actual data in the test suite
3. A smattering of other, useful tools: HTTParty, Rubocop, Brakeman, Shoulda, Responders, and ActiveModel::Serializers

### Future direction

It will be trivial to add a CRUD layer for Owners, Repos, and Event Types.  This would let us craft personalized pages for them, such as a SeeClickFix-specific owner biography or a Repo description.

These endpoints could be used for drop-down selections when making an EventRequest, or even craft an auto-complete text input using a search endpoint in Rails.

Given more time, I'd like to make it conform to JSON-API and build an Ember app on top of the API.