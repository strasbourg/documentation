require 'utils/cts/soap_client'

class Cts::Stop
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  slug :code

  field :name
  field :code, type: Integer

  def next_arrivals(time: Time.now)
    response = cts_soap_client.call :recherche_prochaines_arrivees_web,
      message: { code_arret: self.code, heure: time, nb_horaires: 1}
    response = response.body[:recherche_prochaines_arrivees_web_response]
    response = response[:recherche_prochaines_arrivees_web_result]
    response[:liste_arrivee][:arrivee]
  end

  def timesheets
    response = cts_soap_client.call :recherche_fiches_horaires,
      message: { code_arret: self.code }
    response = response.body[:recherche_fiches_horaires_response]
    response = response[:recherche_fiches_horaires_result]
    response[:fiches_horaires][:fiche_horaire]
  end

  private
  def cts_soap_client
    @cts_soap_client ||= Cts::SoapClient.new
  end
end
