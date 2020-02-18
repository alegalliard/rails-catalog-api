class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all

    render json: @categories
    # veja como sobrescrever o método as_json para alterar o padrão, no model (ref b)
    # methods: :author #ver no model (ref a) o método author 
    # render json: @categories.map { |cat| cat.attributes.merge({author: 'ale'}) } - mergeando um attr
    #, status: :partial_content - status code por tipo
    # root: true - traz o nome do root (nesse caso, category:{...})
    # only: [:atributo] - traz somente os atributos indicados
    # except: [:atributo] - exclui os atributos indicados
  end

  # GET /categories/1
  def show
    render json: @category
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name)
    end
end
