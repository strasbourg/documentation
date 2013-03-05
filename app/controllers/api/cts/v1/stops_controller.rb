class Api::Cts::V1::StopsController < Api::Cts::V1::ApiCtsV1Controller
  load_and_authorize_resource class: 'Cts::Stop'

  def index
  end

  def show
  end
end
