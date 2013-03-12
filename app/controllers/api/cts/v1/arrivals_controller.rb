class Api::Cts::V1::ArrivalsController < Api::Cts::V1::ApiCtsV1Controller
  load_and_authorize_resource :stop, class: 'Cts::Stop'
  def index
    @arrivals = @stop.next_arrivals params.permit(:time).symbolize_keys
    render json: @arrivals
  end
end
