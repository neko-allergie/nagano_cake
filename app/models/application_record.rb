class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #created_at の値を降順で並び替え
  scope :latest, -> { order(created_at: :desc) }
end
