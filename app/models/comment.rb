class Comment < ApplicationRecord
    belongs_to :job, dependent: :destroy
end