# Merlion

## Motivation behind Merlion
Curious to how Rails does its thing, this project tries to mimic the behavior of Rails to the best of my understanding.

## Introduction
Merlion is a rack-based Ruby framework. It comprises of 6 modules; application, controller, renderer, response, route, router.

## Directory Structure
Very similar to rails.

##### app => [config, controllers, models, views], config.ru, Gemfile, Gemfile.lock


## Initialization Process

1. To start the application server, enter `rackup config.ru`.
2. Bundler kicks in and loads the gems specificed in Gemfile.
3. Establish database connection.
4. Merlion gets loaded.
5. Application gets instantiated and bootstrapping begins.


##### wc -l `find /Users/kentan/workspace/merlion/lib -type f` | tail -1
