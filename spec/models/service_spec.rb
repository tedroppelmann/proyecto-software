require 'rails_helper'

RSpec.describe Service, type: :model do
  it "should create correctly" do
    service = Service.new(:nombre => "los limpia pisos",:descripcion => "te voy a limpiar el piso al final del carrete", :cap_max => 3, :precio => 500)
    expect(service).to be_valid
  end

  context "when you try to create a service with out a name" do
    it "should not create because do not have a name" do
      service = Service.new(:descripcion => "te voy a limpiar el piso al final del carrete", :cap_max => 3, :precio => 500)
      expect(service).not_to be_valid
    end

    it "should not create because do not have a description" do
      service = Service.new(:nombre => "los limpia pisos", :cap_max => 3, :precio => 500)
      expect(service).not_to be_valid
    end

    it "should not create because do not have a cap_max" do
      service = Service.new(:nombre => "los limpia pisos",:descripcion => "te voy a limpiar el piso al final del carrete" , :precio => 500)
      expect(service).not_to be_valid
    end

    it "should not create because do not have a precio" do
      service = Service.new(:nombre => "los limpia pisos",:descripcion => "te voy a limpiar el piso al final del carrete" ,:cap_max => 3)
      expect(service).not_to be_valid
    end


  end
end

