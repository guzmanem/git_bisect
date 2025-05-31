# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Limpiar usuarios existentes
User.destroy_all

puts " Iniciando la creación de 100 usuarios de ejemplo..."

# Arrays de datos en español
nombres = [
  "María García López", "José Antonio Martínez", "Carmen Fernández Ruiz", "Francisco Javier González", 
  "Ana María Rodríguez", "Manuel Pérez Sánchez", "Pilar López García", "Antonio Martín Jiménez",
  "Isabel Hernández Moreno", "Juan Carlos Díaz", "Mercedes Muñoz Álvarez", "Miguel Ángel Romero",
  "Rosa María Navarro", "Fernando Gutiérrez", "Dolores Serrano Vázquez", "Alejandro Torres Ramos",
  "Cristina Morales Castro", "Rafael Delgado Herrera", "Silvia Guerrero Medina", "Carlos Eduardo Prieto",
  "Mónica Castillo Rubio", "Javier Ortega Iglesias", "Teresa Vargas León", "Ricardo Herrera Silva",
  "Patricia Ramos Vega", "Andrés Jiménez Molina", "Beatriz Santos Aguilar", "Sergio Blanco Cortés",
  "Lucía Méndez Peña", "Alberto Caballero Cruz", "Nuria Espinoza Flores", "Óscar Fuentes Gallego",
  "Yolanda Campos Pascual", "Roberto Soto Marín", "Gloria Peña Domínguez", "Víctor Manuel Ibáñez",
  "Amparo Vidal Morales", "Eduardo León Cabrera", "Consuelo Reyes Sanz", "Raúl Herrero Núñez",
  "Esperanza Gil Cano", "Ignacio Calvo Rojas", "Marisol Pardo Benítez", "Gonzalo Mendoza Rey",
  "Encarnación Crespo", "Rubén Márquez Peña", "Inmaculada Carrasco", "Santiago Montero Vega",
  "Remedios Gallardo", "Emilio Sánchez Luna", "Soledad Hidalgo", "Joaquín Mora Vicente",
  "Rosario Nieto", "Esteban Cabello Román", "Milagros Velasco", "Lorenzo Bravo Santana",
  "Asunción Carmona", "Nicolás Varela Suárez", "Purificación Mendez", "Marcos Ponce Toledo",
  "Concepción Mata", "Adrián Pedraza Rico", "Virtudes Gallegos", "Hugo Maldonado Villa",
  "Angustias Coronado", "Bruno Figueroa Campos", "Visitación Espejo", "Iván Robles Guerrero",
  "Nieves Sandoval", "Aitor Contreras Lara", "Salud Valero", "Unai Valdés Ortiz",
  "Trinidad Castaño", "Yeray Valverde Moya", "Sagrario Escalante", "Iker Montoya Carrillo",
  "Presentación Gamez", "Aleix Maroto Hervas", "Pureza Acosta", "Biel Bermejo Calvo",
  "Asunción Valle", "Pau Mena Giménez", "Milagros Rico", "Marc Pacheco Rubio",
  "Rosario Galán", "Oriol Paredes Peña", "Remedios Sierra", "Gerard Rivero Soto",
  "Socorro Rueda", "Arnau Aranda Ruiz", "Piedad Velázquez", "Joel Lozano Mora",
  "Concepción Toro", "Nil Palacios Vera", "Virtudes Bueno", "Jan Marin Vega",
  "Angustias Vaca", "Gael Quiroga Campo", "Milagros Franco", "Thiago Aparicio León"
]

ciudades = [
  "Madrid", "Barcelona", "Valencia", "Sevilla", "Zaragoza", "Málaga", "Murcia", "Palma",
  "Las Palmas", "Bilbao", "Alicante", "Córdoba", "Valladolid", "Vigo", "Gijón", "Hospitalet",
  "Vitoria", "Granada", "Elche", "Oviedo", "Badalona", "Cartagena", "Terrassa", "Jerez",
  "Sabadell", "Móstoles", "Santa Cruz", "Pamplona", "Almería", "Alcalá de Henares",
  "Fuenlabrada", "Leganés", "Donostia", "Burgos", "Salamanca", "Huelva", "Lleida",
  "Tarragona", "León", "Cádiz", "Dos Hermanas", "Parla", "Torrejón", "Alcorcón"
]

100.times do |i|
  nombre = nombres.sample
  
  # Generar email basado en el nombre
  email_base = nombre.downcase
                    .gsub(/[áàäâ]/, 'a')
                    .gsub(/[éèëê]/, 'e')
                    .gsub(/[íìïî]/, 'i')
                    .gsub(/[óòöô]/, 'o')
                    .gsub(/[úùüû]/, 'u')
                    .gsub(/ñ/, 'n')
                    .gsub(/[^a-z\s]/, '')
                    .split(' ')
                    .first(2)
                    .join('.')
  
  dominios = ['gmail.com', 'yahoo.es', 'hotmail.com', 'outlook.es', 'telefonica.net', 'orange.es']
  email = "#{email_base}#{rand(1..999)}@#{dominios.sample}"
  
  # Generar teléfono español
  telefono = "#{[6, 7, 9].sample}#{rand(10000000..99999999)}"
  
  # Roles con distribución realista
  roles = ['user'] * 70 + ['moderator'] * 20 + ['admin'] * 10
  rol = roles.sample
  
  # Estados con distribución realista (85% activos)
  activo = rand(1..100) <= 85
  
  usuario = User.create!(
    name: nombre,
    email: email,
    phone: telefono,
    city: ciudades.sample,
    role: rol,
    active: activo
  )
  
  print "." if (i + 1) % 10 == 0
end

puts "\n\n Proceso completado!"
puts " Estadísticas de usuarios creados:"
puts "   • Total de usuarios: #{User.count}"
puts "   • Administradores: #{User.where(role: 'admin').count}"
puts "   • Moderadores: #{User.where(role: 'moderator').count}"
puts "   • Usuarios regulares: #{User.where(role: 'user').count}"
puts "   • Usuarios activos: #{User.where(active: true).count}"
puts "   • Usuarios inactivos: #{User.where(active: false).count}"
puts "\n Tu datatable estará lleno de datos para tu demo de git bisect!"
