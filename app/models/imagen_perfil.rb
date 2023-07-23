class ImagenPerfil < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end
