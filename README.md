# TestStack

### _Build Anywhere, Test Here_

[![Code Climate](https://codeclimate.com/github/critickio/teststack/badges/gpa.svg)](https://codeclimate.com/github/critickio/teststack)
[![Build Status](https://travis-ci.org/critick/teststack.svg?branch=demo)](https://travis-ci.org/critick/teststack)

This is Testing Framework based on BDD principles in Ruby ,you can use this for  

* automate the tests with step definitions in ruby
* executable-specifications and live documentation of features
* execute tests suite for products Web , Mobile and API's interfaces
* support for executing tests on docker containers


### How to Run Tests

From the project root directory
To run with for specific application  
```  
$ cucumber DRIVER=<driver_name> APP=<app_type> SERVER=<server_name>
```

(Eg :to run only API type tests for app running on example server)

```  
$ cucumber DRIVER=chrome APP=web SERVER=https://example.com -p api
```

* DRIVER can be firefox, chrome, poltergeist(for headless), appium
* APP  can be web or native for Android and iOS native apps, default is web
* SERVER can be any backend api server URL

profile can be any of the below

* api      :run all tests for api
* web      :run all tests for web
* moble    :run all tests for web


OR if you want to run a single feature only

```
$ cucumber DRIVER=poltergeist SERVER=https://test.example.com features/<feature_name>.feature
```

OR if you want to run all features with report
```
$ cucumber DRIVER=<driver_name> SERVER=<server_name> features/<feature_name>.feature --format html --out report.html
```

if you want to run all features with console output of test results
```
$ cucumber DRIVER=<driver_name> SERVER=<server_name> --format pretty
```

OR For Lazy Forks (like me) we have rake tasks

1.to run api tests
```
$ rake api
```

2.to run web tests
```
$ rake web
```

3.to run appium tests
```
$ rake app
```

### Setup with Docker
after installing docker ,you can run any test inside docker containers
```
$ docker-compose up                       #for starting example-web app  
$ docker exec teststack rake api          #for api tests
$ docker exec teststack rake web          #for web tests execution on headless browser
$ docker exec teststack rake webapp       #for web tests execution on selenium grid
```

##Setup without Docker

1.prepare system with package manager

install homebrew on mac
OR apt-get package manager on Ubuntu

Install gpg on system ,for mac

```
$ brew install gpg
```
OR on Ubuntu

```
$ sudo apt-get install gpg
```

2.Install Ruby on mac /ubuntu

Install the latest stable release of Ruby.
```
$ curl -sSL https://get.rvm.io | bash -s stable
$ rvm install ruby
```

Make sure rvm is using the correct ruby by default
```
$ rvm list
$ rvm --default use 2.3.0
```

If you have an old ruby/rvm, you can example with
```
$ rvm get head
$ rvm autolibs homebrew
$ rvm install ruby
```

Check that it’s installed properly by printing the ruby version.
```
$ ruby --version
```

Update RubyGems and Bundler.

```
$ gem update --system
$ gem install --no-rdoc --no-ri bundler
$ gem update
$ gem cleanup
$ gem install bundler
```

clone the repo and run bundle install ,all dependencies will be added

```
$ git clone git@github.com:critickio/TestStack.git
$ cd Teststack
$ bundle install
```

2.For Poltergeist,
On Mac

```
$ brew install phantomjs
```
On Ubuntu,you  use below command ,to install phantomjs (2.2.1)

```
$ PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
$ curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
$ tar xvjf $PHANTOM_JS.tar.bz2
$ mv $PHANTOM_JS /usr/local/share
$ ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
```

3.Install nodejs using brew.
```
$ brew update
$ brew upgrade node
$ brew install node
```
Node should be v0.10.26 or better

4.Install appium

```
$ npm install -g appium
$ appium
```


## Library documentation
* Appium
http://www.rubydoc.info/github/appium/ruby_lib/Appium/  
* Capybara
http://www.rubydoc.info/github/jnicklas/capybara/master
* SitePrism
http://www.rubydoc.info/gems/site_prism/frames
* Poltergeist
https://github.com/teampoltergeist/poltergeist
* Cucumber
http://www.rubydoc.info/github/cucumber/cucumber-ruby/
* Rest-Client
http://www.rubydoc.info/github/rest-client/rest-client/master
* Docker https://docs.docker.com/engine/quickstart/



## Troubleshooting

1.Appium installation issues

When using Appium.app make sure to set Appium -> Preferences… -> Check “Use External Appium Package” and set it to the path of Appium cloned from GitHub.

Fix permission errors. npm shouldn’t require sudo.

```
$ brew uninstall node
$ brew install node
$ rm -rf ./node_modules
$ rm -rf "/Users/`whoami`/.npm"
$ rm -rf /usr/local/lib/node_modules/
$ ./reset.sh --ios
$ ./reset.sh --android
```

If you see config errors, try cleaning git.
```
$ git clean -dfx; git reset --hard
```
### Directory structure

```
├── config
│   ├── cucumber.yml
│   ├── env.rb
│   ├── mobile
│   │   ├── android
│   │   └── ios
│   └── hook.rb
├── data
│   └── fixtures
├── helpers
├── features
│   ├── api
│   └── app
│   └── web
├── pages
│   ├── api
│   ├── app
│   ├── web
│   └── application.rb
├── step_definitions
│   ├── api
│   ├── app
│   └── web
├── lib
│   ├── reporting
│   ├── viewer
├── scripts
│   ├── docker
│   │   ├── Dockerfile
│   │   └── docker.sh
│   └── mobile
│       └── run_appium.sh
├── docker-compose.yml
├── Rakefile
└── wiki
```

## WikiP
https://github.com/critickio/TestStack/wiki

## Repo Owner
irfan ahmad, irfan@critick.io

## Contributing
https://github.com/irfanah/TestStack/blob/master/CONTRIBUTING.md
