# Introduction

Immediastagram is a simple Ruby on Rails application that uses the Instagram API to fetch, store, and view photos and videos that were taken near a user-specified latitude and longitude

### Getting started

There are 4 config variables you have to set to make the app work:

1. `LATITUDE`
2. `LONGITUDE`
3. `MAX_DISTANCE_IN_METERS`
4. `INSTAGRAM_CLIENT_ID`

LATITUDE:
  Latitude of coordinates you want to fetch Instagrams from. Find coordinates at Google ,

LONGITUDE:
  Longitude of coordinates you want to fetch Instagrams from,

MAX_DISTANCE_IN_METERS:
  Search radius from coordinates, in meters. Must be between 1 and 5000,

INSTAGRAM_CLIENT_ID:
  Register your application at http://instagram.com/developer and get a Client ID,

You can convert an address to latitude and longitude at [latlong.net](http://www.latlong.net/convert-address-to-lat-long.html) or [Google Maps](https://www.google.com/maps).

The config variable `MAX_DISTANCE_IN_METERS` determines the search radius from your coordinates when looking for Instagram media. Instagram lets you search a radius of up to 5,000 meters, but for many coordinates, especially in crowded cities, you'll get better results if you choose a lower value, maybe in the neighborhood of 50 to 100 meters

You'll need to register you app with Instagram in order to get an `INSTAGRAM_CLIENT_ID`:

- Head to [Instagram's developer website](http://instagram.com/developer) and sign in with your normal Instagram credentials
- Click the **Register Your Application** button
- Click the **Register a New Client** button
- Fill out the form. Leave the checkboxes in their default states. Enter `http://localhost` for the OAuth redirect_uri
- The Client ID is all you need, you can ignore the Client Secret

### Development environment setup
bundle install

bundle exec rake db:drop db:create db:migrate && bundle exec rake initial_instagram_items:initial_instagram_items
