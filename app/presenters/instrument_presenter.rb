class InstrumentPresenter < BasePresenter
  presents :instrument
  delegate :description, :manufacturer, to: :instrument

  def details
    text  = ''
    text += "<strong>man.</strong> #{instrument.manufacturer}  " if instrument.manufacturer
    text += "<strong>mod.</strong> #{instrument.model}  "        if instrument.model
    text += "<strong>s/n</strong> #{instrument.sn}  "            if instrument.sn
    text += "<strong>p/n</strong> #{instrument.pn}  "            if instrument.pn
    text.strip.html_safe
  end

  def reference
    h.link_to instrument.reference, instrument
  end

  def edit_link
    h.link_to 'Edit', h.edit_instrument_path(instrument)
  end

  def destroy_link
    h.link_to 'Destroy', instrument, method: :delete, data: { confirm: 'Are you sure?' }
  end
end
