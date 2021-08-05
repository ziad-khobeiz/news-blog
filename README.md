# Legendary News Blog

A web application for a journal to manage the articles posted by the journalists.

Journalists can sign up and post articles using the website.

The owner account is the only one that can delete articles or approve articles to be published.

The website includes a list of publicly available articles. The articles are sorted descendingly by the popularity of the authors (the number of published articles). You don't need to sign in to view the publicly available articles.

On the index page for articles, the journalists can view all the articles posted by all the journalists. A journalist's own articles are listed above the other journalists' articles.

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
Note: For a new journalist to sign up, the journalist can visit ```/journalists/sign_up```.

