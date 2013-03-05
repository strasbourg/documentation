desc 'get stops code'
task 'cts:fetch:codes' => :environment do
  require 'utils/cts/soap_client'

  client = Cts::SoapClient.new

  next_page_exists = true
  # letter = 'a'
  page = 1
  # while letter <= 'z'
    while next_page_exists
      response = client.call(:rechercher_codes_arrets_depuis_libelle, message: { saisie: '', no_page: page }).body[:rechercher_codes_arrets_depuis_libelle_response][:rechercher_codes_arrets_depuis_libelle_result]
      puts "Fetching page #{page}"

      response[:liste_arret][:arret].each do |arret|
        stop = Cts::Stop.find_or_initialize_by code: arret[:code]
        stop.name = arret[:libelle]
        stop.save!
        puts "Saving #{stop.name}"
      end

      next_page_exists = response[:suite]
      page += 1
    end
    # letter!
  # end
end
