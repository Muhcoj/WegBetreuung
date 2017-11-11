class KontoumsaetzesController < ApplicationController

  def index
  end

  def new
    @kontoumsaetze = Kontoumsaetze.new
  end

  def create
    @kontoumsaetze = Kontoumsaetze.new(params.require(:kontoumsaetze).permit(:weg, :wertstellung, :umsatzart, :buchungsdetails, :auftraggeber, :empfaenger, :betrag, :saldo))

    @kontoumsaetze.save

    redirect_to @kontoumsaetze
  end

  def show
    @kontoumsaetze = Kontoumsaetze.find(params[:id])
  end

end
