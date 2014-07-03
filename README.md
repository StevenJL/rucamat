# Rucamat
#### Ruby Class and Module Analysis Tool

Command Line Tool to analyze all the classes, modules, and methods in your Ruby project.

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
rucamat

# generates the json
{
  "search_stats": {
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

##### You can specify directories


##### Find all the methods that contain a given search string.
You can use keywords to search your code.  Find all the classes, modules, and methods that contain certain keywords.  For example, let's say I want to find all the methods which have the keyword "tag.ancestor" in the "app/models" directory.

```
rucamat -query 'tag.ancestor' -directory 'app/models'

{
  "search_stats": {
    "num_of_classes": "1",
    "num_of_modules: "0",
    "num_of_methods": "2"
  },

  "classes":[
    {
      "name": "TagController",
      "search_results": [
        {
          "line_number": "7",
          "code": "     if !tag.ancestors.empty?"
        }
      ]
      "methods": [
        {
          "name": "create",
          "search_results":[
            {
              "line_number": "25",
              "code": "      tags.ancestors.each do |tag|"
            },
            {
              "line_number": "40",
              "code": "      temp_array = tags.ancestors.reverse"
            },
          ]
        }
      ]
    }
  ]

```

### Options

You can specify directories to look
```
rucamat -directory 'app/models/'
# only look for classes, modules, and methods in the models directory

rucamat -directory 'lib/'
# only look for classes, modules, and methods in the lib directory
```

You can sort by alphabetical or number of lines of code
```
rucamat -sort num_of_lines
# the classes, modules, and methods are all returned in order number of
# lines of code descending

rucamat -sort alpha
# the classes, modules, and methods are all returned in alphabetical order
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/rucamat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
