RoR Workshops
================

Hi! We think it’s great that you want to start learning **Ruby on Rails**. Taking part in workshops is also a **great opportunity to start working** with us and become one of the Netguru folks. Since you have just taken your first step on your adventure with programming in RoR, we challenge you to complete the following task. **Ready, steady… Go!**

### :hash: App description
-------------
Simple application for managing school subjects, teaching staff and students.

Don't know how sth should work?
Check it out [http://ror-workshops.herokuapp.com/](http://ror-workshops.herokuapp.com/)

### :closed_lock_with_key: Technology stack
-------------

| Name |  Version |
| :--: | :---: |
| [Ruby](https://www.ruby-lang.org) | 2.2.3 |
| [Ruby on Rails](http://www.rubyonrails.org/) | 4.2.1 |
| [PostgreSQL](http://www.postgresql.org/) | 9.3 |

### :book: Setup
-------------
1. clone repository,
2. `cd path/to/repo`,
3. `cp config/database.yml.sample config/database.yml`,
4. `createuser -s workshops`,
5. `rake db:create db:schema:load`

### :book: Read and remember
-------------

#### :information_source: additional info

* we know this file is too long to read but it is worth it :smile:,
* write informative commit messages - take a look at short [styleguide](http://chris.beams.io/posts/git-commit/).

#### :white_check_mark: what you should do to qualify for the workshops

* do not fork the repository - clone it,
* all tests should pass - run it in your app folder via `RAILS_ENV=test bundle exec rspec`,
* connect Travis CI to your repo, add badge and ensure your application has "build | passing status". Check documentation [here](http://docs.travis-ci.com/user/status-images/),
* deploy your application to Heroku - ensure that seeds are available there and your application works correctly,
* prepare seeds with:
  * 3 teachers,
  * 25 students,
  * 5 subjects


### :warning: What disqualifies your application
-------------

* tests are not passing,
* website doesn't work on Heroku (don't forget about seeds),
* repo is not connected with TravisCI,
* your repo was forked from the original one,
* your work is not reflected in commit history - your git history consists of one or two commits.

### :cake: Additional tasks
-------------
These tasks are optional, failure does not disqualify You from participation in workshops.


* add `birthdate` column to `Student` model.
  * column should be optional,
  * handle the create/edit/show actions in views (StudentsController)
  * display that date in `ReportsController#subjects` in format `RRRR-MM_DD`

* Add a function that allows storing data about student payments in the database. In the main menu You should add a new section which will direct users to the page with the students list where you can find information about whether they paid for their tuition, as well as the date of the payment for each month. Try to use [datatables](https://www.datatables.net/) ([datatables-rails](https://github.com/rweng/jquery-datatables-rails)) so that you can easily search for people in the table using their names and surnames.

Don't forget to write some specs in rspec for Your code :)

### :information_source: Gems, that may become helpful during solving this tasks and also during workshops
-------------

* [decent_exposure](https://github.com/hashrocket/decent_exposure),
* [decent_decoration](https://github.com/netguru/decent_decoration),
* [draper](https://github.com/drapergem/draper),
* [devise](https://github.com/plataformatec/devise),
* [simple_form](https://github.com/plataformatec/simple_form),
* [byebug](https://github.com/deivid-rodriguez/byebug)/[pry](https://github.com/pry/pry).

Useful gems for improving your workflow:
* [git-up](https://github.com/aanand/git-up) - Stop using "git pull". Be polite.

### :information_source: Bundle of hints and links
-------------

* [https://try.github.io](https://try.github.io/levels/1/challenges/1) - Learn how to use Git by reviewing the basic concepts of Git version control
* [http://www.codeschool.com/paths/ruby](http://www.codeschool.com/paths/ruby) - free Ruby and Rails courses available at the elementary level,
* you want to be sure your Ruby basis are solid? Check out the Ruby Koans - [http://rubykoans.com/](http://rubykoans.com/),
* [http://guides.rubyonrails.org/](http://guides.rubyonrails.org/) - sooner or later this one will come in handyk
* not feeling comfortable with JavaScript / jQuery? CodeSchool can help you with this one too - [http://www.codeschool.com/courses/try-jquery](http://www.codeschool.com/courses/try-jquery),
* [http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/) - old, but still helpful article about extracting the logic into single classes,
* [https://netguru.co/blog/ups-and-downs-of-pull-request-flow-part-1](https://netguru.co/blog/ups-and-downs-of-pull-request-flow-part-1) - why we prefer to work with single-branch flow, part 1,
* [https://netguru.co/blog/ups-and-downs-of-pull-request-flow-1](https://netguru.co/blog/ups-and-downs-of-pull-request-flow-1) - why we prefer to work with single-branch flow, part 2,
* [http://www.creativebloq.com/javascript/javascript-debugging-beginners-3122820](http://www.creativebloq.com/javascript/javascript-debugging-beginners-3122820) - quick introduction to debugging JavaScript code.
