class Wiki < ApplicationRecord
  belongs_to :user
  #has_attached_file :image, :path => ":blocipedia/assets/images/:basename_:style.:extension", styles: { medium: "300x300>", thumb: "100x100>" }

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }

  validates :body, presence: true, length: { minimum: 15, maximum: 1000 }

  #validates_attachment :image,
    #content_type: { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
end
