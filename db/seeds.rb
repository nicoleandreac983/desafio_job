usuario_normal = Usuario.create!(
    nombre: "Usuario Normal",
    email: "usuario@ejemplo.com",
    password: "123456",
    role: "normal_user"
)

# Crea un administrador con foto de perfil
usuario_admin = Usuario.create!(
    nombre: "Administrador",
    email: "admin@ejemplo.com",
    password: "123456",
    role: "admin"
)

ImagenPerfil.create!(
    imageable: usuario_admin,
    url: "https://pruebaportal.s3.amazonaws.com/3hi9becb0k4mdmrfwxrcuz4txytn"
)

# Crea 5 ofertas laborales
5.times do |n|
    Ofertum.create!(
    titulo: "Oferta laboral",
    descripcion: "Descripción de la oferta laboral",
    salario: "840.000",
    horas: "45 horas",
    ciudad: "Valparaíso",
    usuario: usuario_admin
    )
end