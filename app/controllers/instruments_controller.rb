class InstrumentsController < ApplicationController
  respond_to :html

  def index
    @instruments = Instrument.all
    respond_with @instruments
  end

  def new
    @instrument ||= Instrument.new
  end

  def create
    @instrument = Instrument.new instrument_params
    flash[:notice] = 'Instrument was successfully created' if @instrument.save_and_retry_on_unique
    respond_with @instrument
  end

  def show
    @instrument = Instrument.find(params[:id])
    respond_with @instrument
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    flash[:notice] = 'Instrument was successfully destroyed' 
    respond_with @instrument
  end

protected
  def instrument_params
    params.require(:instrument)
          .permit(:reference,
                  :description,
                  :manufacturer, :model, :sn, :pn,
                  :remarks)
          .delete_if{ |k, v| v.blank? }
  end
end
