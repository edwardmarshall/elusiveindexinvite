# Elusive Index Invite Development Readme

This readme is intended for use by the Edward Marshall development team and sub contractors hired to work on this project.

## Local Development setup

This application makes use of environment variables, and `unicorn` as our Rack server. This application is hosted on `heroku` in our production environement. As such it is advisable to run your local development setup using `foreman` in order to acurately test and best match our production environment while in development.

For security reasons, environment variables **are not** included in source control, and you should take the same consideration to make sure that not secure information is ever included into source control. Examples include:

* Amazon SES Username/Password
* Other API Keys

Because our application does make use of some of these items you will need to setup a `.env` file with these configuration variables in place so the application functions properly.

### Setup

Once you have cloned the repository, create a `.env` and `Procfile` in the root application directory.

Install foreman:
```
gem install foreman
```

Copy and paste the following code into your `Procfile`:
```
web: bundle exec unicorn -p $PORT -E $RACK_ENV -c ./config/unicorn.rb
```

Setup your `.env` file with the following config variables:
```
PORT=3000
RACK_ENV=development
ADMIN_MODE=false
SES_USERNAME=<SES_USERNAME_HERE>
SES_PASSWORD=<SES_PASSWORD_HERE>
```

Again for security reasons the `SES_USERNAME`, `SES_PASSWORD` are not included here to keep secure information out of source control. See our secure application config document for the real variables.

Once the `.env` and `Procfile` are setup, you may run the server with the following command:
```foreman start```

### Assets

Assets should be precompiled before pushing to Heroku. This makes a faster push. Use the following command to compile assets for production:

```
RAILS_ENV=production bundle exec rake assets:precompile
```

## Questions

Send all application questions to Eric Taylor at [eric@edwardmarshall.co](mailto://eric@edwardmarshall.co).