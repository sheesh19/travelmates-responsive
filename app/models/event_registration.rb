class EventRegistration < ApplicationRecord
  belongs_to :event
  belongs_to :user

  #                 0      1        2
  enum status: %i[pending approved cancelled]

  private

  def cancel
    self.update(status: :cancelled)
  end
end
