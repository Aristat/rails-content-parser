link_tag_name = TagName.find_by_name('link')
if link_tag_name.nil?
  TagName.create!(name: 'link')
end

h1_tag_name = TagName.find_by_name('h1')
if h1_tag_name.nil?
  TagName.create!(name: 'h1')
end

h2_tag_name = TagName.find_by_name('h2')
if h2_tag_name.nil?
  TagName.create!(name: 'h2')
end

h3_tag_name = TagName.find_by_name('h3')
if h3_tag_name.nil?
  TagName.create!(name: 'h3')
end
