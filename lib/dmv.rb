class Dmv

  def initialize
    @facilities = []
  end

  def facilities
    @facilities
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    @facilities.find do |facility|
      facility.services.include?(service)
    end
  end
end
