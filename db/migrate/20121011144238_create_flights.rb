class CreateFlights < ActiveRecord::Migration[4.2]

  def change
    create_table :users do |u|
      u.string :name
      u.string :email
      u.boolean :admin, default: false
    end

    create_table :flights do |f|
      f.integer :num_flight
      f.date :date
      f.time :depart
      f.string :from
      f.string :to
      f.integer :duration
      f.integer :cost
      f.integer :passengers_disponibles
    end

    create_table :bookings do |b|
      b.belongs_to :flight
      b.integer :num_booking
      b.integer :total
    end

    create_table :users_bookings do |ub|
      ub.belongs_to :user
  	  ub.belongs_to :booking
    end

    create_table :users_flights do |uf|
      uf.belongs_to :user
  	  uf.belongs_to :flight
    end
  end
end
