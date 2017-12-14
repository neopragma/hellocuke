# hellocuke

Sample project for use in demos and workshops. It illustrates a basic Cucumber setup for practicing or demonstrating Behavior Driven Development or Specification by Example to drive modifications to an existing "Hello, World!" application. 

## Assumptions

* Linux or Unix environment
* Bash 4.x installed
* UTF-8 support installed

## About the sample application

The "application" is a single HTML file with some trivial JavaScript embedded in it. It is designed to be served as static Web content. It displays the phrase, "Hello, World!" in various languages. It is intentionally simple, as the purpose is to demonstrate a technique and not to build a real-world system. 

The test project is in Ruby. It uses Cucumber and Rspec to define examples and executable steps.

## Purpose

The original use case that led to the project was to demonstrate how to test-drive a modification to existing code at the "acceptance test" level. 

The learning goal for the demonstration is for participants to understand that test-driven development helps when modifying existing code, and is not limited to greenfield development; the approach is also not limited only to development at the microtest level.

You can adapt the project to serve whatever purpose you have for a presentation or workshop. 

## Typical demonstration

After resetting all the files to the "starting point" for demonstration (see below), the sequence of steps is to implement the following requirements in order:

1. Make the Russian greeting less formal. Say Привет instead of Здравствуйте.
1. Add support for Italian. Say Ciao mondo!

These requirements are documented in the file ```stories.txt```.

### First story

The backstory is that our marketing department has determined we can increase sales in Russia if our product is positioned in a less formal way. This will make it attractive to younger consumers.

Begin by changing the Gherkin in the file ```features/helloworld.feature```.

Run the cukes and show that the Russian check now fails for the right reason.

Change the "application code" in ```app/helloworld.html``` so that the correct phrase is displayed.

Run the cukes and show that the application now exhibits the desired behavior.

### Second story

The backstory is that we are going to expand our business into Italy, so we need to be able to greet Italians.

Begin by changing the Gherkin in the file ```features/helloworld.feature``` so that it expects to see the greeting in Italian as well as in the languages already supported.

Run the cukes and show that an error is thrown before the example even runs. This demonstrates how test-driving a modification can yield an error that helps us identify other areas in the code base that must be changed. If we didn't test-drive the modification, we might overlook these other changes and end up having to debug a problem in production or in some other downstream environment that's less convenient to work with than our local development environment.

Explain that end users will recognize the name of their native language, so we want the drop-down list on the Web page to display the native language names, but the programmers who support the application will only know the English names of the languages. Therefore, there's a lookup method in ```features/support/helpers.rb``` that cross-references the English language names with their native counterparts. This method does not include Italian. Add Italian to the method.

Run the cukes and show that the application now runs, but the output does not match the expected output.

Add Italian to the file ```app/helloworld.html```.

Run the cukes and show that everything works according to the latest specifications.

### Help for adding Unicode text

Words for the Russian and Italian text are provided in the file ```phrases.txt```. You can copy and paste words from there into the solution during the demonstration, so you needn't worry about having international input methods configured on your system. 

## Environment setup

You will need ```git``` installed so that you can clone the project. Install it as per usual for the environment you choose to use.

You will need the X-windows virtual frame buffer package, Xvfb, to run the cukes headless. Install it as per usual for the environment you choose to use. 

You will need Ruby development tools installed on a Linux or Unix instance. It makes no difference if you use a Ruby version manager like ```rbenv``` or ```rvm```. These instructions make no assumptions about that.

I've been using Ruby 2.2.3 for this demo, and I don't know if older versions will work. My guess is they won't. It isn't my intention to support multiple versions and combinations of things. It's only a demo.

Use any text editor or IDE you prefer. The default text editor on your platform is sufficient for the level of text editing you will do in this demo.

I have set this up on Ubuntu and Debian Linux distros. Some manual changes may be needed to set it up on other systems. 

As a convenience, I have some Ruby development environment setup scripts for provisioning VMs: 

* Debian: [provision-ruby-dev-debian](http://github.com/neopragma/provision-ruby-dev-debian) (still in development)
* Ubuntu: [provision-ruby-dev-ubuntu](http://github.com/neopragma/provision-ruby-dev-ubuntu)

Once you have an instance configured for Ruby development, clone the repo for this project:

```shell 
git clone http://github.com/neopragma/hellocuke
```

To run the demo as a non-admin user, I suggest installing the gems as a non-admin user into a directory owned by the user:

```shell 
cd hellocuke
gem install --path vendor/bundle
```

If you install as ```root``` you'll have to do the whole demo as ```root```. The standard user will not be able to make changes. 

In principle, the project should be in the "start" state when you clone the repo. It's always possible that someone committed changes from a previous demo and left the files in the "finished" state. A ```bash``` script is provided to reset the files to the "start" state so you can run the demo multiple times. You might want to run it pre-emptively before doing your first demo, just in case.

```shell
cd hellocuke
./reset
```

## Firefox and Selenium Webdriver

The sample project uses Selenium Webdriver to interact with Firefox. Specific versions of Selenium Webdriver work with specific versions of Firefox. I suggest you find compatible versions of these two products and ensure they are installed on the instance you're using.

According to [Selenium documentation](http://www.seleniumhq.org/about/platforms.jsp):

"Support for Firefox is the latest release, the previous release, the latest ESR release and the previous ESR release."

I assume that makes sense to someone. I haven't found a simple, straightforward list of compatible versions. 

In the meantime, I was able to get the demo to work recently using Firefox 56 and selenium-webdriver (gem) 3.8.0.

Using ```geckodriver``` might solve the compatibility problem, but I haven't tried it. If you get it working, please submit a pull request.

Install a specific version of Firefox: [https://ftp.mozilla.org/pub/firefox/releases/](https://ftp.mozilla.org/pub/firefox/releases/)

## Running the project

The script ```app/server``` starts a Python SimpleHTTPServer in the ```app``` directory. The server can serve static content located in the directory where it is launched. The "application" will be accessible at ```localhost:8000/helloworld.html```.

To start the Xvfb you can run the ```bash``` script provided:

```shell
cd hellocuke
./vscreen
```

or start the process however you wish. The provided script associates the virtual screen with device 99.

Now you can run the cukes. The ```Rakefile``` defines two tasks that mirror the two most common ways people run cukes. 

The default task opens browser windows as the examples run. People often run cukes this way while they're working on changes, so they can see the effects.

```shell
bundle exec rake
```

or just

```shell
rake
```

The ```headless``` task runs the examples in headless mode and writes formatted results to the file, ```hellocukes.html```. This is a very simple unattended setup, not unlike the way people set up Cucumber for continuous integration. 

Of course, a "real" application would have many examples, possibly divided up by feature sets or by execution speed or split for concurrent execution or for other reasons. That's not the point of this demo.

You can show the results by opening ```hellocukes.html``` in a web browser.

```shell 
bundle exec rake headless
```

or just

```shell
rake headless
```

or

```
HEADLESS=true rake
```





