class KontoumsaetzesController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @kontoumsaetzes = Kontoumsaetze.all

    respond_to do |format|
      format.html
      format.xlsx
    end
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

  def destroy
    @kontoumsaetze.delete
    redirect_to kontoumsaetzes_path, notice: 'Ihre Kontoumsätze wurde erfolgreich entfernt'
  end

  def import
    Kontoumsaetze.import(params[:file])
    redirect_to kontoumsaetzes_path, notice: "Erfolgreich importiert"
  end

  private

    def post_params
      params.require(:kontoumsaetze).permit(:weg, :wertstellung, :umsatzart, :buchungsdetails, :auftraggeber, :empfaenger, :betrag, :saldo)
    end

    def set_post
      @kontoumsaetze = Kontoumsaetze.find(params[:id])
    end

end
