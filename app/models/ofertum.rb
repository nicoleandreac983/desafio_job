class Ofertum < ApplicationRecord
  belongs_to :usuario
  has_one :imagen_perfil, as: :imageable
  has_many :postulacions
  has_many :usuarios, through: :postulacions
end
