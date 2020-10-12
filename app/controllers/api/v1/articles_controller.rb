module Api
    module V1
        class ArticlesController < ApplicationController 
            def index
                articles = Article.all
                render json: {status: 'SUCESS', message:'Articles Loaded', data:articles}
            end

            def show
                article = Article.find(params[:id])
                render json: {status: 'SUCESS', message:'Articles Loaded', data:articles}
            end

            def create
             article = Article.new(article_params)

             if article.save
                render json: {status: 'SUCESS', message:'Article Saved', data: article}
             else
                render json: {status: 'ERROR', message:'Article Not Saved', data:articles.error}
             end
            end

            def destroy
                article = Article.find(params[:id])
                article.destroy
                render json: {status: 'SUCESS', message:'Article Deleted', data: article}
            end

            def update
             article = Article.find(params[:id])

             if article.update(article_params)
                render json: {status: 'SUCESS', message:'Article Updated', data: article}
             else
                render json: {status: 'ERROR', message:'Article Not Updated', data:articles.error}
             end   
            end

            private

            def article_params
                params.require(:article).permit(:title, :body)
            end

        end
    end
end