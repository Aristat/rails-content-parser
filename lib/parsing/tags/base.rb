module Parsing
  module Tags
    class Base
      attr_reader :website, :tag_name
      attr_accessor :nokogiri

      def initialize(website, nokogiri, tag_name)
        @website = website
        @nokogiri = nokogiri
        @tag_name = tag_name
      end

      def parse
        # override
      end
    end
  end
end
