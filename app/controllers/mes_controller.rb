class MesController < ApplicationController
  
  before_action :set_me, only: [:show, :edit, :update, :destroy]

  # GET /mes
  def index
    @mes = Me.all
  end

  # GET /mes/1
  def show
  end

  # GET /mes/new
  def new
    @me = Me.new
  end

  # GET /mes/1/edit
  def edit
  end
  
  def registered
  end

  # POST /mes
  def create
    @me = Me.new(me_params)

	respond_to do |format|
      if @me.save
        MemailerMailer.welcome_email(@me).deliver_later
        flash[:notice] = "User #{@me.name} was successfully created."
        format.html { redirect_to(:action=>:registered) } #default was :index
        format.xml  { render :xml => @me, :status => :created, :location => @me }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @me.errors, :status => :unprocessable_entity }
      end
    end
    #if @me.save
     # redirect_to @me, notice: 'Me was successfully created.'
    #else
     # render :new
    #end
  end

  # PATCH/PUT /mes/1
  def update
    if @me.update(me_params)
      redirect_to @me, notice: 'Me was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mes/1
  def destroy
    @me.destroy
    redirect_to mes_url, notice: 'Me was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_me
      @me = Me.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def me_params
      params.require(:me).permit(:name, :email)
    end
end
