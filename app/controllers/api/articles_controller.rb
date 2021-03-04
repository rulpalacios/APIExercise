module Api
  class ArticlesController < ApiController
    before_action :set_article, only: %i[ show update destroy ]

    # GET /articles or /articles.json
    def index
      @articles = Article.all

      render json: @articles
    end

    # GET /articles/1 or /articles/1.json
    def show
      render json: @article
    end

    # POST /articles or /articles.json
    def create
      @article = Article.new(article_params)

      respond_to do |format|
        if @article.save
          format.json { render :show, status: :created }
        else
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /articles/1 or /articles/1.json
    def update
      respond_to do |format|
        if @article.update(article_params)
          format.json { render :show, status: :ok }
        else
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /articles/1 or /articles/1.json
    def destroy
      @article.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def article_params
        params.require(:article).permit(:name, :description, :price)
      end
  end
end