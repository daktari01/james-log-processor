# james-log-processor
A Ruby application to process log files

## Setting up
1. Clone the application `git clone git@github.com:daktari01/james-log-processor.git`
2. `cd` into the application `cd james-log-processor`
3. Install the dependencies `bundle install`
4. Run the tests `rspec`

## Running the application
1. Create an object of the class, passing a log filepath `example_object = LogProcessor.new('yourfilepath.log')`
2. Run `example_object.most_page_visits` to get a list ordered from most page visits to least page visits
3. Run `example_object.most_unique_page_visits` to get a list ordered from most unique page visits to unique least page visits

## Contributors
James Dindi
