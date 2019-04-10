heroku plugins:install @heroku-cli/plugin-container-registry
docker login --username _ --password= registry.heroku.com
heroku container:push web --app pure-fjord-93329
heroku container:release web --app pure-fjord-93329
