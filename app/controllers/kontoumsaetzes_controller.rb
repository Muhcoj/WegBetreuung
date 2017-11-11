class KontoumsaetzesController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def index
    @kontoumsaetzes = Kontoumsaetze.all
  end

  def new
    @kontoumsaetze = Kontoumsaetze.new
  end

  def create
    @kontoumsaetze = Kontoumsaetze.new(post_params)
    @kontoumsaetze.user_id = current_user.id

    if @kontoumsaetze.save
      redirect_to @kontoumsaetze, notice: "Kontoumsätze gespeichert"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @kontoumsaetze.update(post_params)
      redirect_to @kontoumsaetze, notice: 'Ihre Kontoumsätze wurde erfolgreich aktualisiert'
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:kontoumsaetze).permit(:weg, :wertstellung, :umsatzart, :buchungsdetails, :auftraggeber, :empfaenger, :betrag, :saldo)
  end

  def set_post
    @kontoumsaetze = Kontoumsaetze.find(params[:id])
  end

end
