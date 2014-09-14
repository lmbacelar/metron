class InstrumentsController < ApplicationController
  respond_to :html

  def index
    @instruments = Instrument.all
    respond_with @instruments
  end
end
