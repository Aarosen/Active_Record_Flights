class Controller 
  @@num = 0
  @@flight = []
  def initialize(input_login)
    @view = View.new
    input_login = @view.menu_start
    menu_start(input_login)
    @@num
    @@flight
  end

  def menu_start(input_login)
    case input_login
    when "reservaciones" then menu_reservaciones
    when "administrador" then menu_administradores
    when "salir" then salir
    end
  end

  def menu_reservaciones
    input_reservaciones = @view.menu_reservaciones
    case input_reservaciones.to_i
    when 1 then flights
    when 2 then salir
    end
  end

  def flights
    input_flights = @view.flights
    @@num = input_flights[3].to_i
    flights =  Flight.where(from: input_flights[0]).where(to: input_flights[1]).where(date: input_flights[2]).where('passengers_disponibles > ?', @@num)
    printer_flights(flights)
  end

  def printer_flights(flights)
    sending = @view.print_flights(flights)
    flights.each_with_index do |find, index|
      if index + 1 == sending
        @@flight << find 
      end
      @@flight
    end
    reservacion(@@flight)
  end

  def reservacion(vuelo)
    count = 0
    books = []
    selection = @view.reservacion(vuelo, @@num)
    selection.each do |x|
      count += 1 
      count / 2 
    end
    @@flight.each do |info|
      book = Booking.create(flight_id: info.id, num_booking: rand(10000..99999), total: info.cost*count)
      books << book
    end
    confirmation(books)
  end

  def confirmation(booking)
    @view.print_confirmation(booking)
  end

  def menu_administradores
    input_admin = @view.menu_administradores
    case input_admin.to_i
      when 1 then all_flights
      when 2 then all_bookings
      when 3 then new_flight
    end
  end

  def all_flights
    show = Flight.all
    @view.all_flights(show)
  end

  def all_bookings
    show = Booking.all
    @view.all_bookings(show)
  end

  def new_flight
    airplane = []
    input_flights = @view.new_flight
    num_flight_input = input_flights[0].to_i
    date_input = input_flights[1].to_s
    depart_input = input_flights[2].to_s
    from_input = input_flights[3].to_s
    to_input = input_flights[4].to_s
    duration_input = input_flights[5].to_i
    cost_input = input_flights[6].to_i
    num_input = input_flights[7].to_i
    new_flight =  Flight.create(num_flight: num_flight_input, date: date_input, depart: depart_input, from: from_input, to: to_input, duration: duration_input, cost: cost_input, passengers_disponibles: num_input)
    airplane << new_flight
    print_new_flight(airplane)
  end

  def print_new_flight(airplane)
    @view.print_new_flight(airplane)
  end
end
