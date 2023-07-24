class Postulacion < ApplicationRecord
  belongs_to :usuario
  belongs_to :oferta

end
