require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
              :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil #vehicle_details[:registration_date]
    @plate_type = nil #vehicle_details[:plate_type]
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def set_registration_date
    @registration_date = Date.today
  end

  def assign_plate_type
    if @registration_date

     @plate_type = if antique?
        :antique
      elsif electric_vehicle?
        :ev
      else
        :regular
      end
    end
  end
end
