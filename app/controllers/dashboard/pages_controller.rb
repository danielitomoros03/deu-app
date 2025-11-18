module Dashboard
  class PagesController < ApplicationController
    before_action :set_page, only: %i[ show edit update destroy ]

    # GET /dashboard/pages or /dashboard/pages.json
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

    # GET /dashboard/pages/1 or /dashboard/pages/1.json
    def show
      # @page fue cargada por el método privado :set_page
      respond_to do |format|
        format.json { render json: @page, status: :ok }
        format.html
      end
    end

    # GET /dashboard/pages/new
    def new
      @page = Page.new
    end

    # GET /dashboard/pages/1/edit
    def edit
    end

    # POST /dashboard/pages or /dashboard/pages.json
    def create
      @page = Page.new(page_params)

      respond_to do |format|
        if @page.save
          format.html { redirect_to dashboard_page_path(@page), notice: "Page was successfully created." }
          format.json { render :show, status: :created, location: @page }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /dashboard/pages/1 or /dashboard/pages/1.json
    def update
      respond_to do |format|
        if @page.update(page_params)
          format.html { redirect_to dashboard_page_path(@page), notice: "Page was successfully updated.", status: :see_other }
          format.json { render :show, status: :ok, location: @page }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /dashboard/pages/1 or /dashboard/pages/1.json
    def destroy
      @page.destroy!

      respond_to do |format|
        format.html { redirect_to dashboard_pages_path, notice: "Page was successfully destroyed.", status: :see_other }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def page_params
        params.require(:page).permit(:name, :group, :subgroup, :short_description)
      end
  end
end