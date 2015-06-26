# T7e

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

### Self-hosted translation manager app for Rails

Demo
----

There is a demo available at [http://t7e-demo.herokuapp.com/](http://t7e-demo.herokuapp.com/)

Email: demo@t7e-demo.herokuapp.com<br/>
Password: password


Deploying:
----------

**Deploying to Heroku:**

  * Clone the repository

```bash
git clone http://github.com/visualitypl/t7e_server.git
```
  * Update `db/seeds.rb` with admin credentials for your initial login.

  * Run `bundle`

  * Create & configure for Heroku

```bash
gem install heroku
heroku create example-t7e
heroku addons:add sendgrid:starter
heroku config:add HEROKU=true
heroku config:add SECRET_TOKEN="$(bundle exec rake secret)"
heroku config:add T7E_HOST=some-hostname.example.com
heroku config:add T7E_EMAIL_FROM=example@example.com
git push heroku master
```

  * Seed the DB (_NOTE_: No bootstrap task is used on Heroku!)

```bash
heroku run rake db:migrate
heroku run rake db:seed
```

```bash
heroku open
```



  * Enjoy!