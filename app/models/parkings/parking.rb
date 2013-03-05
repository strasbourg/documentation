class Parkings::Parking
  include Mongoid::Document

  field :name
  field :coordinates, type: Array
  field :address
end
