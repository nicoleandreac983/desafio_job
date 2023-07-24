require 'test_helper'

class PostulacionTest < ActiveSupport::TestCase
  test "crea una postulación válida" do
    oferta = Ofertum.create(titulo: "Oferta de prueba", descripcion: "Descripción de la oferta", salario: "1000", horas: "40", ciudad: "Ciudad de prueba")
    usuario = Usuario.create(nombre: "Usuario de prueba", email: "usuario@example.com", password: "password", role: "normal_user")

    postulacion = Postulacion.new(usuario: usuario, oferta: oferta)
    assert postulacion.valid?
  end

  test "no puede crear una postulación sin oferta" do
    usuario = Usuario.create(nombre: "Usuario de prueba", email: "usuario@example.com", password: "password", role: "normal_user")

    postulacion = Postulacion.new(usuario: usuario)
    assert_not postulacion.valid?
  end

  test "no puede crear una postulación sin usuario" do
    oferta = Ofertum.create(titulo: "Oferta de prueba", descripcion: "Descripción de la oferta", salario: "1000", horas: "40", ciudad: "Ciudad de prueba")

    postulacion = Postulacion.new(oferta: oferta)
    assert_not postulacion.valid?
  end
end

