module Parsing
  module Helper
    def tags_dictionaries
      @dictionaries ||= {}
    end

    def tag_names
      @tag_names ||= TagName.all
    end
  end
end
