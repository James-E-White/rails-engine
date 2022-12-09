class Item < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name

  def self.search_by_name(params)
    where('name ILIKE ?', "%#{params}%")
  end
end
