# Dictionary Website

#### By Jared Clemmensen

## Description
Project completed for Epicodus - Ruby Week 2 Code Review

This dictionary app is build using ruby and sinatra and deployed using heroku. It basic functionality is a custom dictionary builder using the wordnik API. It allows the user to build a word-list, automatically populates each word with a definition pulled from wordnik, and also allows the user to add a custom definition.

## Setup/Installation Requirements
This app is deployed to heroku at https://protected-harbor-42082.herokuapp.com/

## Technologies Used
Languages: Ruby & HTML
Gems: Sinatra, Capybara, rspec, wordnik

## Specifications
### Backend
1. Word class initializes with a hash of attributes
  * Example Input: 'example'
  * Logic: input inserted to hash { :word => 'example', :definition => 'example definition' }, new instance of word class created with that hash
  * Example Output: input word added to list of words on page, which sorts alphabetically every time a word is added
2. Each instance of word class calls on wordnik api to get definition and synonyms
  * Example Input: 'example'
  * Example Output: Method parses api return to display example definition


###Frontend
1. User adds words to list on main page
  * Example Input: 'example', 'test', 'antelope'
  * Example Output: a list of all added words, where each word is a clickable link to the definition page for that word
2. User adds custom definitions in definition page
  * Example Input: 'custom definition 1', 'custom definition 2'
  * Example Output: a list of custom definitions in addition to the dictionary definition and other word info on the page
3. User is able to return to word list, then revisit a particular word and have previously entered definitions still be there


### License

Copyright (c) 2018 Jared Clemmensen

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
