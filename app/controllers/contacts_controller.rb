class ContactsController < ApplicationController
  def new
    # sólo muestra el formulario
  end

  def create
    render plain: "Recibido: #{params.inspect}"
  end
end