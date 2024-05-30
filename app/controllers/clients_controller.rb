class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /clients or /clients.json
  def index
    @clients = Client.all
    render json: @clients
  end

  # GET /clients/1 or /clients/1.json
  def show
    render json: @clients
  end

  # GET /clients/new
  def new
    @client = Client.new
    render json: @clients
  end

  # GET /clients/1/edit
  def edit
    render json: @clients
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        render json: @clients
      else
        render json: @clients, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        render json: @clients
      else
        render json: @clients, status: :unprocessable_entity
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy!

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:nome, :sobrenome, :endereco)
    end
end
