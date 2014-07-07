# README

[![Code Climate](https://codeclimate.com/github/StevenJL/rucamat.png)](https://codeclimate.com/github/StevenJL/rucamat)

## Rucamat (Work in Progress)
##### Ruby Class, Module, and Methods Catalog and Analysis Tool

Command line tool to catalog, search, and analyze all the classes, modules, and methods in your Ruby project.  Generates a JSON-tree of the modules, classes, and methods in Ruby project.  Supports options such as:

1) Find all modules, classes, methods which contain a search query (great for debugging, refactoring, etc.)

2) Specify the directories to look in. It defaults to the Ruby project root, but you can specify the directory 'lib/' or 'app/controllers/'.

3) Search specific classes and modules to analyze. (ie. reports only classes with names that contain the string 'Controller')

4) Sort results by alphabetical order, or "size" defined as number of lines.  It defaults to alphabetical.

### Installation

Add this line to your application's Gemfile:

    gem 'rucamat'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rucamat

### Usage

###### Generate a json of all modules, classes, and methods in your project with basic stats.

```
# /src/ruby_projects/my_fav_ruby_project

$ rucamat generate

# generates the json
{
  "stats": {
    "num_of_classes": "4",
    "num_of_modules: "1",
    "num_of_methods": "20"
  },

  "modules": [
    { "name": "Article",
      "num_of_lines": "231",
      "classes": [
        {
          "name": "UberArticleController",
          "num_of_lines": "128",
          "locations": ["app/controllers/article/uber_article_controller.rb"],
          "methods": [ 
            { 
              "name": "new",
              "num_of_lines": "12"
            },
            {
              "name": "create",
              "num_of_lines": "20"
            }
          ]
        }
      ],      
    }
  ],

  "classes": [
    {
      "name": "ApplicationController",
      "num_of_lines": "150",
      "locations:" ["app/controllers/application_controller.rb"]
      "methods": [
        {
          "name": "set_cache_headers",
          "num_of_lines": "5"
        }
      ]
    }
  ]
}
```

###### Search through your code for a query string, and view the results in a nice json format.
You can use keywords to search your code.  Find all the classes, modules, and methods that contain certain keywords.  For example, let's say I want to find the places where a `user` model calls its `validate` method.  If we know all models live in `app/models`, we can just specify that directory.

```
$ rucamat generate --query='user.validate' --directory='app/models'

{
  "stats": {
    "num_of_classes": "1",
    "num_of_modules: "0",
    "num_of_methods": "2"
  },

  "classes":[
    {
      "name": "UserController",
      "locations:" ["app/controllers/user_controller.rb"],
      "methods": [
        {
          "name": "create",
          "search_results":[
            {
              "line_number": "25",
              "search_result": "      user.validate if user"
            },
            {
              "line_number": "40",
              "search_result": "     user.validate "
            },
          ]
        }
      ]
    }
  ]
}

```

#### Options Usage

You can specify which classes or modules to analyze.  Note these options are used in conjunction (boolean and operator) and returns only results satisfying ALL constraints.

```
$ rucamat generate --class='ApplicationController'
$ rucamat generate --module='Helper'
```

You can specify directories to look
```
rucamat generate --directory='app/models/'
# only look for classes, modules, and methods in the models directory

rucamat generate --directory='lib/'
# only look for classes, modules, and methods in the lib directory
```

You can sort by alphabetical or number of lines of code
```
rucamat generate --sort='num_of_lines'
# the classes, modules, and methods are all returned in order number of
# lines of code descending (ie. biggest modules/classes/methods first)

rucamat generate --sort='alphabetical'
# the classes, modules, and methods are all returned in alphabetical order

# let's use every option!
rucamat generate --module='Admin' --class='User' --query='def validate' --directory='lib/' --sort='alphabetical'
# we're only searching in Admin::User in the lib directory for the code 'def validate' and we're sorting the results alphabetically.
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/rucamat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


