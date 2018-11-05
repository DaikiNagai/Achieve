class Blog < ApplicationRecord
    validates :title,presence: true
    belongs_to :User, optional: true
end
