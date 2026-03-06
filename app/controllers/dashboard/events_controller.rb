module Dashboard
  class EventsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_event, only: %i[ show edit update destroy ]

    # GET /events or /events.json
    def index
      @events = Event.accessible_by(current_ability).order(day: :desc, created_at: :desc)
    end

    # GET /events/1 or /events/1.json
    def show
      authorize! :read, @event
    end

    # GET /events/new
    def new
      @event = Event.new
      authorize! :new, @event
    end

    # GET /events/1/edit
    def edit
      authorize! :update, @event
    end

    # POST /events or /events.json
    def create
      @event = Event.new(event_params)
      authorize! :create, @event

      respond_to do |format|
        if @event.save
          format.html { redirect_to dashboard_event_path(@event), notice: "Evento creado exitosamente." }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /events/1 or /events/1.json
    def update
      authorize! :update, @event
      respond_to do |format|
        if @event.update(event_params)
          format.html { redirect_to dashboard_event_path(@event), notice: "Evento actualizado exitosamente.", status: :see_other }
          format.json { render :show, status: :ok, location: @event }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /events/1 or /events/1.json
    def destroy
      authorize! :destroy, @event
      @event.destroy!

      respond_to do |format|
        format.html { redirect_to dashboard_events_path, notice: "Evento eliminado exitosamente.", status: :see_other }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = Event.accessible_by(current_ability).find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def event_params
        params.require(:event).permit(:title, :day, :category, :description, :image_event)
      end
  end
end
