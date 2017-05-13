module Parsing
  module Tags
    class Link < Base
      def parse
        links = @nokogiri.search('a[href]').select { |n| n['href'][/\Ahttp/] }.map { |n| n['href'] }
        links.each do |link|
          WebsiteContent.create!(name: link, website_id: @website.id, tag_name_id: @tag_name.id)
        end
      end
    end
  end
end
