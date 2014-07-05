# Rucamat
#### Ruby Class and Module Analysis Tool

Command Line Tool to catalog, search, and analyze all the classes, modules, and methods in your Ruby project.

## Installation

Add this line to your application's Gemfile:

    gem 'rucamat'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rucamat

## Usage

##### Generate a json of all modules, classes, and methods in your project.

```
# in the root directory of your ruby project
# /src/ruby_projects/my_fav_ruby_project
rucamat generate

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

##### Find all the methods that contain a given search string.
You can use keywords to search your code.  Find all the classes, modules, and methods that contain certain keywords.  For example, let's say I want to find all the methods which have the keyword "tag.ancestor" in the "app/models" directory.

```
rucamat generate --query='tag.ancestor' --directory='app/models'

{
  "stats": {
    "num_of_classes": "1",
    "num_of_modules: "0",
    "num_of_methods": "2"
  },

  "classes":[
    {
      "name": "TagController",
      "locations:" ["app/controllers/tag_controller.rb"],
      "methods": [
        {
          "name": "create",
          "search_results":[
            {
              "line_number": "25",
              "search_result": "      tags.ancestors.each do |tag|"
            },
            {
              "line_number": "40",
              "search_result": "      temp_array = tags.ancestors.reverse"
            },
          ]
        }
      ]
    }
  ]

```

### Options

You can specify which classes or modules.  Note these options are used in conjunction (boolean and operator) and returns only results satisfying ALL constraints.

```
rucamat generate --class='ApplicationController'
rucamat generate --module='Helper'
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
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/rucamat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
