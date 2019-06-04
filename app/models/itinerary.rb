class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :events

  def self.add_slugs
    update(slug: to_slug(name))
  end
end
