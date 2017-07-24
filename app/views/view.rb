class View
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario
  # Los siguientes métodos son sólo un ejemplo:
  
	def menu_start
    puts "Bienvenido a Vuelos Aaron's"
    puts "=================================="
    puts "__________________________________"
    puts "|         Reservaciones          |"
    puts "__________________________________"
    puts "|          Adminitrador          |"
    puts "__________________________________"
    puts "|             Salir              |"
    puts "__________________________________"
    puts "=================================="
    puts
    puts "Selecciona la opción:"
    gets.chomp
	end

  def menu_reservaciones
    puts "Bienvenido!!!"
    puts "================================================="
    puts "_________________________________________________"
    puts "|   1)    Encuentra tu próximo vuelo            |"
    puts "_________________________________________________"
    puts "|   2)                Salir                     |"
    puts "_________________________________________________"
    puts "================================================="
    puts
    puts "Selecciona opción:"
    gets.chomp
  end

  def flights
    puts "From:"
    from = gets.chomp
    puts "To:"
    to = gets.chomp
    puts "Date:"
    date = gets.chomp
    puts "Number of passengers flying:"
    passengers = gets.chomp
    array = [from, to, date, passengers]
  end

  def print_flights(flights)
    flights.each_with_index do |flight_info, index|
      puts "---------------------------------------------------------------------"
      puts "#{index + 1}) No Vuelo: #{flight_info.num_flight}"
      puts "Date: #{flight_info.date} , Depart: #{flight_info.depart} From: #{flight_info.from}," 
      puts "To: #{flight_info.to}, Duration: #{flight_info.duration}, Precio: #{flight_info.cost}, Lugares Disponibles: #{flight_info.passengers_disponibles}"
      puts "---------------------------------------------------------------------"
    end
    puts
    puts "Selecciona tu vuelo:"
    seleccion = gets.chomp.to_i
    seleccion
  end

	def reservacion(vuelo, passengers)
    array = []
    vuelo.each do |vuelo_info|
      puts "---------------------------------------------------------------------"
      puts "Flight Number: #{vuelo_info.num_flight}"
      puts "---------------------------------------------------------------------"
      puts "Date: #{vuelo_info.date}, Depart: #{vuelo_info.depart}"
      puts "From: #{vuelo_info.from}, To: #{vuelo_info.to} Duration: #{vuelo_info.duration}, Price: #{vuelo_info.cost}"
      puts "---------------------------------------------------------------------"
      passengers.times do |number|
        puts "Information of person:"
        puts
        puts "Enter the name:"
        name = gets.chomp
        puts "Email:"
        email = gets.chomp
        puts
        puts
        array << [name, email]
      end
      puts "The information is correct (Yes / No) for the #{passengers} passengers?"
      correct = gets.chomp
    end
    array
	end

  def print_confirmation(booking)
    booking.each do |book|
      puts "********************************"
      puts "Payment process done Correctly"
      puts "********************************"
      puts
      puts "The total price is: #{book.total}"
      puts "Your reservation ID is: #{book.num_booking}"
    end
  end

  def menu_administradores
    puts "Welcome Adminitrator!!!"
    puts "================================================="
    puts "_________________________________________________"
    puts "|   1)      Muestra todos los vuelo             |"
    puts "_________________________________________________"
    puts "|   2)   Muestra todas las reservaciones        |"
    puts "_________________________________________________"
    puts "|   3)       Crea un nuevo vuelo                |"
    puts "_________________________________________________"
    puts "|   4)                Salir                     |"
    puts "_________________________________________________"
    puts "================================================="
    puts
    puts "Selecciona opción:"
    gets.chomp
  end

  def all_flights(show)
    show.each_with_index do |one, index|
      puts "---------------------------------------------------------------------"
      puts "#{index + 1}) No Vuelo: #{one.num_flight}"
      puts "Date: #{one.date} , Depart: #{one.depart} From: #{one.from}," 
      puts "To: #{one.to}, Duration: #{one.duration}, Precio: #{one.cost}, Lugares Disponibles: #{one.passengers_disponibles}"
      puts "---------------------------------------------------------------------"
    end
  end

  def all_bookings(show)
    show.each_with_index do |one, index|
      puts "---------------------------------------------------------------------"
      puts "#{index + 1}) Flight Number: #{one.flight_id}"
      puts "Booking Number: #{one.num_booking}, Total Price: #{one.total}"
      puts "---------------------------------------------------------------------"
    end
  end

  def new_flight
    puts "Put the Flight Number (4 digits):"
    num_flight = gets.chomp
    puts "Put the Date (format: YYYY-MM-DD):"
    date = gets.chomp
    puts "Put the Departing Time (format: 'HH:MM:SS'):"
    depart = gets.chomp
    puts "Put the City of Departure:"
    from = gets.chomp
    puts "Put the City of Destination:"
    to = gets.chomp
    puts "Put the Duration of the Flight (number of hours):"
    duration = gets.chomp
    puts "Put the Price of the Flight:"
    cost = gets.chomp
    puts "Put the Number of Seats Available:"
    num = gets.chomp
    info = [num_flight, date, depart, from, to, duration, cost, num]
  end

  def print_new_flight(new_flight)
    new_flight.each_with_index do |flight, index|
      puts "---------------------------------------------------------------------"
      puts "#{index + 1}) No Vuelo: #{flight.num_flight}"
      puts "Date: #{flight.date} , Depart: #{flight.depart} From: #{flight.from}," 
      puts "To: #{flight.to}, Duration: #{flight.duration}, Precio: #{flight.cost}, Lugares Disponibles: #{flight.passengers_disponibles}"
      puts "---------------------------------------------------------------------"
    end
  end
end
