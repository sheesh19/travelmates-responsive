class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :itineraries
  # not sure abt this relation
  # user should be able to access event directly??
  has_many :events, through: :itineraries
  has_many :event_registrations

  has_many :favorite_itineraries
  has_many :favorite_users
  has_many :event_favorites # update the name in order to inline with schema and event_favorite model

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  def favorited_itinerary?(itinerary)
    favorite_itineraries.where(itinerary: itinerary).any?
  end

  def find_favorite_itinerary(itinerary)
    favorite_itineraries.where(itinerary: itinerary).first
  end

  def favorited_event?(event)
    event_favorites.where(event: event).any?
  end

  def find_event_favorite(event)
    event_favorites.where(event: event).first
  end

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def following?(user_id)
    relationship = Follow.find_by(follower_id: id, following_id: user_id)
    return true if relationship
  end
end
