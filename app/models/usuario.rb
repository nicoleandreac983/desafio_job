class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_one :imagen_perfil, as: :imageable
    enum :role, [:normal_user, :admin]
    def admin?
      role == "admin"
    end
    has_many :ofertas, through: :postulaciones
    has_many :postulacions
end
