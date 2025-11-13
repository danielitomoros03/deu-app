module Api
  module V1
    class PagesController < ApplicationController
      # Se recomienda saltar el CSRF token para APIs
      skip_before_action :verify_authenticity_token 
      before_action :set_page, only: [:show]

      # GET /api/v1/pages y /api/v1/pages.json
      def index
        @pages = Page.all
        
        # 💥 Negociación de Contenido: Responde al formato solicitado
        respond_to do |format|
          # Si la petición es .json (o pide JSON en los headers)
          format.json { render json: @pages, status: :ok } 
          
          # Si la petición es normal (HTML), busca la vista .html.erb
          format.html 
        end
      end
      
      # GET /api/v1/pages/:id y /api/v1/pages/:id.json
      def show
        # @page fue cargada por el método privado :set_page
        respond_to do |format|
          format.json { render json: @page, status: :ok }
          format.html
        end
      end
      
      # Aquí iría la lógica para create, update y destroy

      private
      
      # Carga el recurso por ID o devuelve un error 404
      def set_page
        @page = Page.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Página no encontrada' }, status: :not_found and return
      end

      # Los strong parameters son necesarios para POST/PUT/PATCH
      # def page_params
      #   params.require(:page).permit(:title, :slug, :body)
      # end
    end
  end
end