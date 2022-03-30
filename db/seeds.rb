Garden.destroy_all if Rails.env.development?
# Plant.destroy_all if Rails.env.development?
# PlantTag.destroy_all if Rails.env.development?

Garden.create!(
name: "My little Garden",
banner_url: "https://images.unsplash.com/photo-1585320806297-9794b3e4eeae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z2FyZGVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"
)

Garden.create!(
  name: "My Other Garden",
  banner_url: "https://images.unsplash.com/photo-1585320806297-9794b3e4eeae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z2FyZGVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"
  )

#Create plants

plants_data = [
  {
    name: "Vanilla Orchid",
    photo_url: "https://images.unsplash.com/photo-1555037015-1498966bcd7c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    garden: Garden.first
  },
  {
    name: "Tillandsia Bromellia",
    photo_url: "https://images.unsplash.com/photo-1560375562-c8e1ca00751d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
    garden: Garden.first
  },
  {
    name: "Pau brasilis",
    photo_url: "https://images.unsplash.com/photo-1513943517251-aa4a9e64ed24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2829&q=80",
    garden: Garden.first
  }
]

plants_data.each do |plant|
  Plant.create!(plant)
end


# Create Tags and add them to plants

tag_names = Tag::NAMES

tag_names.each do |tag_name|
  Tag.create!(name: tag_name)
end

flower_tag = Tag.find_by(name: "Flower")
plant_tag = PlantTag.new
plant_tag.tag = flower_tag
plant_tag.plant = Plant.first
plant_tag.save!
