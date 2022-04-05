class LogProcessor
  def initialize(log_file)
    @log_file = log_file
  end

  def most_page_visits
    tally_array = []
    log_array = process_file(@log_file)
    log_array.each { |item| tally_array << item.split(/\s+/)[0] }
    most_visits_response = "List of webpages with most page views ordered from most pages views to less page views: \n"
    sort_array_of_hashes(tally_array.tally).each do |item|
      response_string = "#{item[0]} #{item[1]} visits \n"
      most_visits_response << response_string
    end
    most_visits_response
  end

  def most_unique_page_visits
    items_array = []
    process_file(@log_file).each { |item| items_array << item.split(/\s+/) }
    log_hash_array = []
    items_array.map { |item| item_hash = {}; item_hash[item[0]] = item[1]; log_hash_array << item_hash }
    log_group_array = log_hash_array.group_by { |item| item.keys[0] }
    log_group_array = log_group_array.map { |key, value| Hash[key, value.map { |item| item[key] }.uniq.length] }
    most_visits_unique_response = "List of webpages with most unique page views ordered from most pages views to less page views: \n"
    sort_array_of_hashes(log_group_array.reduce({}, :update))
      .map { |item| response_string = "#{item[0]} #{item[1]} unique visits \n"; most_visits_unique_response << response_string }
    most_visits_unique_response
  end

  private

  def process_file(file)
    File.readlines(file)
  end

  def sort_array_of_hashes(array_of_hashes)
    array_of_hashes.sort_by { |_, count| -count }
  end
end

log_p = LogProcessor.new('files/webserver.log')
log_t = LogProcessor.new('files/test.log')

puts log_p.most_unique_page_visits
