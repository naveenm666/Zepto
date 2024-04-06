class Address < ApplicationRecord
    belongs_to :user
    validates :current_location, presence: true


    enum :address_type, [:Home, :Work, :Other]

end
