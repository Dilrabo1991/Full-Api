class CommercesController < MainApiController
  before_action :auth_custom, only: [:update, :destory, :create]
  before_action :set_commerce, only: %i[ show update destroy ]

  def index
    @commerces = Commerce.all

    render json: @commerces
  end

  def show
    render json: @commerce
  end

  def create
    @commerce = Commerce.new(commerce_params)

    if @commerce.save
      render json: @commerce, status: :created, location: @commerce
    else
      render json: @commerce.errors, status: :unprocessable_entity
    end
  end

  def update
    if @commerce.update(commerce_params)
      render json: @commerce
    else
      render json: @commerce.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @commerce.destroy
  end

  private
    def set_commerce
      @commerce = Commerce.find(params[:id])
    end

    def commerce_params
      params.require(:commerce).permit(:color, :department, :price, :promotion_code, :material, :brand, :vendor)
    end
end
