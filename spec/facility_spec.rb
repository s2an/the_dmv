require 'spec_helper'

RSpec.describe Facility do
 
  before(:each) do
    #Iteration1
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    #Iteration2
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
  end
  
  it 'can initialize' do
    #Iteration1
    expect(@facility).to be_an_instance_of(Facility)
    expect(@facility.name).to eq('DMV Tremont Branch')
    expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
    expect(@facility.phone).to eq('(720) 865-4600')
    expect(@facility.services).to eq([])
    #Iteration2
    expect(@facility_1).to be_an_instance_of(Facility)
    expect(@facility_1.name).to eq('DMV Tremont Branch')
    expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
    expect(@facility_1.phone).to eq('(720) 865-4600')
    expect(@facility_1.services).to eq([])
    expect(@facility_2).to be_an_instance_of(Facility)
    expect(@facility_2.name).to eq('DMV Northeast Branch')
    expect(@facility_2.address).to eq('4685 Peoria Street Suite 101 Denver CO 80239')
    expect(@facility_2.phone).to eq('(720) 865-4600')
    expect(@facility_2.services).to eq([])
  end
  
  #Iteration1
  it 'can add available services' do
    expect(@facility.services).to eq([])
    
    @facility.add_service('New Drivers License')
    @facility.add_service('Renew Drivers License')
    @facility.add_service('Vehicle Registration')
    
    expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
  end
  
  #Iteration2
  it 'can register vehicles' do
    cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    
    @facility_1.add_service('Vehicle Registration')
    @facility_1.register_vehicle(cruz)

    expect(@facility_1.services).to eq(['Vehicle Registration'])
    expect(@facility_1.registered_vehicles).to eq([cruz])
    expect(@facility_1.register_vehicle(cruz)).to eq([cruz])    
  end
  
  it 'can be an empty/nil/0' do
    expect(@facility_1.registered_vehicles).to eq([])
    expect(@facility_1.collected_fees).to eq(0)
    
    bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    
    expect(@facility_2.registered_vehicles).to eq([])
    expect(@facility_2.register_vehicle(bolt)).to eq([])
    expect(@facility_2.registered_vehicles).to eq([])
    expect(@facility_2.services).to eq([])
    expect(@facility_2.collected_fees).to eq(0)
  end
  
  it 'can take in information' do
    bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
   
    @facility_1.add_service('Vehicle Registration')
    @facility_1.register_vehicle(cruz)

    expect(@facility_1.collected_fees).to eq(100)
    expect(@facility_1.register_vehicle(camaro)).to eq([cruz, camaro])    
    expect(@facility_1.register_vehicle(bolt)).to eq([cruz, camaro, bolt])    
    expect(@facility_1.collected_fees).to eq(325)
  end
end
