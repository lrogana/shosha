class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :show, :new]
  before_action :correct_user,   only: [:destroy, :edit]
  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    @tournament = Tournament.includes(:teams, :games).find(params[:id])
  end

  # GET /tournaments/new
  def new
    # @tournament = Tournament.new
     @tournament = current_user.tournaments.build if logged_in?
  end

  # GET /tournaments/1/edit
  def edit

  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    # @tournament = Tournament.new(tournament_params)
    @tournament = current_user.tournaments.build(tournament_params)

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament }
        flash[:info] = 'Tournament was successfully created.'
        format.json { render :show, status: :created, location: @tournament }
      else
        format.html { render :new }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to @tournament }
        flash[:info] = 'Tournament was successfully updated'
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tournament_params
      params.require(:tournament).permit(:name, :tournament_date,
                                         :contact_name,
                                         :contact_phone_number, :email, :sport,
                                         :user_id,
                                         address: [:street_address, :city, :state, :zip])
    end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  # Confirms the correct user.

  def correct_user
    @tournament = current_user.tournaments.find_by(id: params[:id])
    redirect_to root_url if @tournament.nil?
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
