class Cts::SoapClient < Savon::Client
  def initialize
    super(
      env_namespace: :soap,
      namespaces: {
        'xmlns' => 'http://www.cts-strasbourg.fr/',
      },
      convert_request_keys_to: :camelcase,
      soap_header: {
        'CredentialHeader' => {
          'ID' => ENV['CTS_ID'],
          'MDP' => ENV['CTS_MDP']
        }
      },
      wsdl: 'http://tr.cts-strasbourg.fr/HorTRwebserviceExtv3/Service.asmx?WSDL'
    )
  end
end
