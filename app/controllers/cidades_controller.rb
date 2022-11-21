class CidadesController < ApplicationController
  before_action :set_cidade, only: [:show, :update, :destroy]
  before_action :set_estado, only: [:index]
  # GET /cidades
  def index
    @cidades = @estado.cidades.all
    render json: @cidades
  end

  # GET /cidades/1
  def show
    render json: @cidade
  end

  # POST /cidades
  def create
    @cidade = Cidade.new(cidade_params)

    if @cidade.save
      render json: @cidade, status: :created, location: @cidade
    else
      render json: @cidade.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cidades/1
  def update
    if @cidade.update(cidade_params)
      render json: @cidade
    else
      render json: @cidade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cidades/1
  def destroy
    @cidade.destroy
  end

  # GET /cidades/rio de janeiro
  def nome
    # @cidade = Cidade.where('lower(nome) like ?', "%#{params[:nome].downcase}%")
    @cidades = Cidade.select("cidades.id, cidades.nome, estados.nome as nome_estado, estados.sigla as sigla_estado").left_joins(:estado).where("lower(cidades.nome) LIKE ?", "%#{params[:nome].downcase}%" )
    render json: @cidades
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cidade
      @cidade = Cidade.find(params[:id])      
    end

    def set_estado
      @estado = Estado.find(params[:estado_id])      
    end
    # Only allow a list of trusted parameters through.
    def cidade_params
      params.require(:cidade).permit(:estado_id, :nome)
    end
    # LER https://guides.rubyonrails.org/active_record_querying.html
    # @cidade = Cidade.select(:id, :nome, :estado_id).where('lower(cidades.nome) like ?', "%#{param.downcase}%").joins(:estado)
    # Cidade.select("cidades.id, cidades.nome, estados.sigla").left_joins(:estado).where(cidades: {nome: "%Assis%"})

end
