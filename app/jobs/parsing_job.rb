class ParsingJob < ApplicationJob
  queue_as :default

  def perform(website_id)
    website = Website.find(website_id)

    service = Parsing::WebsiteService.new(website)
    service.parse
  end
end
