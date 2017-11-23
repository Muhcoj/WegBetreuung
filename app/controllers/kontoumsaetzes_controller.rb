class KontoumsaetzesController < ApplicationController
  before_action :set_kontoumsaetze, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if admin_types.include?(current_user.type)
      @kontoumsaetzes = Kontoumsaetze.page(params[:page]).per(10)
    else
      @kontoumsaetzes = Kontoumsaetze.kontoumsaetze_by(current_user).page(params[:page]).per(8)
    end

    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def new
    if admin_types.include?(current_user.type)
      @kontoumsaetze = Kontoumsaetze.new
    else
      redirect_to kontoumsaetzes_path, alert: 'Access denied'
    end
  end

  def create
    @kontoumsaetze = Kontoumsaetze.new(kontoumsaetze_params)
    #@kontoumsaetze.user_id = current_user.id
    #@user = @finance.user(params[:id])

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
    if @kontoumsaetze.update(kontoumsaetze_params)
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

    def kontoumsaetze_params
      params.require(:kontoumsaetze).permit(:weg, :wertstellung, :umsatzart, :buchungsdetails, :auftraggeber, :empfaenger, :betrag, :saldo, :user_id)
    end

    def set_kontoumsaetze
      @kontoumsaetze = Kontoumsaetze.find(params[:id])
    end

end
