module Parsing
  class WebsiteService
    include Helper

    # Valid tags for parsing
    TAGS_LIST = %w(h1 h2 h3 link)

    attr_reader :website

    def initialize(website)
      @website = website
      generate_dictionary
    end

    def parse
      nokogiri = Nokogiri::HTML(open(@website.url))

      tag_names = TagName.all
      tag_names.each do |tag_name|
        next unless tags_dictionaries.has_key?(tag_name.name)

        klass = tags_dictionaries[tag_name.name]
        klass.new(@website, nokogiri, tag_name).parse
      end
    end

    private

    def generate_dictionary
      TAGS_LIST.each do |tag|
        klass = ['parsing/tags', tag].join(?/).classify.safe_constantize
        next if klass.nil?

        tags_dictionaries[tag] = klass
      end
    end
  end
end
