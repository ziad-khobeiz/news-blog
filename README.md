# Legendary News Blog

This is an application designed for a journal to manage the articles that are being posted by the journalists.

## Steps to run the app

First clone the repo and `cd` into the directory:

```
$ git clone https://github.com/ziad-khobeiz/news-blog.git
$ cd news-blog
```

Then install the needed gems:

```
$ bundle install
```

Install yarn:

```
$ yarn install
```

Then create and migrate the database:

```
$ rake db:create
$ rake db:migrate
```

Run the add_owner rake task to create an account for the owner of the journal with the following credintials:

email: ```micheal@email.com```

password: ```admin1234```

The owner can update his email, password, and name later.

```
$ rake add_owner
```

Finally, run the app in a local server:

```
$ rails server
```
