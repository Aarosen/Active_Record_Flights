class User < ActiveRecord::Base
  has_many :users_flights
  has_many :flights, :through => :users_flights
  has_many :users_bookings
  has_many :bookings, :through => :users_bookings
end

class Flight < ActiveRecord::Base
  has_many :users_flights
  has_many :users, :through => :users_flights
end

class Booking < ActiveRecord::Base
  belongs_to :flight
  has_many :users_bookings
  has_many :users, :through => :users_bookings
end

class UsersBooking < ActiveRecord::Base
  belongs_to :user
  belongs_to :booking
end

class UsersFlight < ActiveRecord::Base
  belongs_to :user
  belongs_to :flight
end