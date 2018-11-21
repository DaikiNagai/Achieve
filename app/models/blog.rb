class Blog < ApplicationRecord
    validates :title,presence: true
    belongs_to :User, optional: true
    has_many :comments, dependent: :destroy
end
