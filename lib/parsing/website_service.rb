module Parsing
  class WebsiteService
    include Helper

    attr_reader :website

    def initialize(website)
      @website = website
      generate_dictionary
    end

    def parse
      nokogiri = Nokogiri::HTML(open(website.url))

      tag_names.each do |tag_name|
        next unless tags_dictionaries.has_key?(tag_name.name)

        klass = tags_dictionaries[tag_name.name]
        klass.new(@website, nokogiri, tag_name).parse
      end
    end

    private

    def generate_dictionary
      tag_names.each do |tag_name|
        klass = ['parsing/tags', tag_name.name].join(?/).classify.safe_constantize
        next if klass.nil?

        tags_dictionaries[tag_name.name] = klass
      end
    end
  end
end
