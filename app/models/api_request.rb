class ApiRequest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :ip_address
  field :scope
  field :params, type: Hash
end
