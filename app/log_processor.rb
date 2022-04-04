class LogProcessor
  def initialize(log_file)
    @log_file = log_file
  end

  def process_file
    log_array = File.readlines(@log_file)
    tally_array = []
    log_array.each { |item| tally_array << item.split(/\s+/)[0] }
    most_visits_response = "List of webpages with most page views ordered from most pages views to less page views: \n"
    tally_array = tally_array.sort_by! { |item| item['value'] }
    tally_array.tally.sort_by { |_, count| -count }.each do |item|
      response_string = "#{item[0]} #{item[1]} visits \n"
      most_visits_response << response_string
    end
    most_visits_response
  end
end

log_p = LogProcessor.new('files/webserver.log')
log_t = LogProcessor.new('files/test.log')

puts log_p.process_file
