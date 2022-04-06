describe LogProcessor do

  log_test = LogProcessor.new('files/test.log')
  describe 'most_page_visits' do
    it 'returns correct data' do
      expected_result = "List of webpages with most page views ordered from most pages views to less page views: \n/help_page/1 6 visits \n/contact 3 visits \n/home 3 visits \n/about/2 3 visits \n/index 3 visits \n/about 2 visits \n"
      expect(log_test.most_page_visits).to eq expected_result
    end
  end

  describe 'most_unique_page_visits' do
    it 'returns correct data' do
      expected_result = "List of webpages with most unique page views ordered from most pages views to less page views: \n/help_page/1 5 unique visits \n/home 3 unique visits \n/index 3 unique visits \n/contact 2 unique visits \n/about/2 2 unique visits \n/about 2 unique visits \n"
      expect(log_test.most_unique_page_visits).to eq expected_result
    end
  end
end
