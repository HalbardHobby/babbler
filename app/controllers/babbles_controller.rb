class BabblesController < ApplicationController
  before_action :set_babble, only: %i[ show edit update destroy ]

  # GET /babbles or /babbles.json
  def index
    @babbles = Babble.where("expires_at >= ?", Time.now)
  end

  # GET /babbles/1 or /babbles/1.json
  def show
  end

  # GET /babbles/new
  def new
    @babble = Babble.new
  end

  # GET /babbles/1/edit
  def edit
  end

  # POST /babbles or /babbles.json
  def create
    @babble = Babble.new(
      babble_params.merge(user_id: current_user.id, expires_at: 1.days.from_now)
    )

    respond_to do |format|
      if @babble.save
        format.html { redirect_to @babble, notice: "Babble was successfully created." }
        format.json { render :show, status: :created, location: @babble }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @babble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /babbles/1 or /babbles/1.json
  def update
    respond_to do |format|
      if @babble.update(babble_params)
        format.html { redirect_to @babble, notice: "Babble was successfully updated." }
        format.json { render :show, status: :ok, location: @babble }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @babble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /babbles/1 or /babbles/1.json
  def destroy
    @babble.destroy
    respond_to do |format|
      format.html { redirect_to babbles_url, notice: "Babble was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_babble
      @babble = Babble.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def babble_params
      params.require(:babble).permit(:content, :expires_at, :user_id)
    end
end
