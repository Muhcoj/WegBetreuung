class KontoumsaetzesController < ApplicationController
  before_action :set_post, only: [:show]

  def index
  end

  def new
    @kontoumsaetze = Kontoumsaetze.new
  end

  def create
    @kontoumsaetze = Kontoumsaetze.new(post_params)

    if @kontoumsaetze.save
      redirect_to @kontoumsaetze, notice: "Kontoumsätze gespeichert"
    else
      render :new
    end
  end

  def show
  end

  private

  def post_params
    params.require(:kontoumsaetze).permit(:weg, :wertstellung, :umsatzart, :buchungsdetails, :auftraggeber, :empfaenger, :betrag, :saldo)
  end

  def set_post
    @kontoumsaetze = Kontoumsaetze.find(params[:id])
  end

end
