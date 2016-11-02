class RegistersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_register, only: [:show, :edit, :update, :destroy]
  after_action :check_fibo
  layout :resolve_layout

  def fib(n)
    return n if (0..1).include? n
    fib(n-1) + fib(n-2) if n > 1
  end

  def thankyou
    
  end

  # GET /registers
  # GET /registers.json
  def index
    @registers = Register.all
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
  end

  # GET /registers/new
  def new
    @register = Register.new
  end

  # GET /registers/1/edit
  def edit
  end

  # POST /registers
  # POST /registers.json
  def create
    @register = Register.new(register_params)

    respond_to do |format|
      if @register.save
        format.html { redirect_to :action => "thankyou" }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /registers/1
  # PATCH/PUT /registers/1.json
  def update
    respond_to do |format|
      if @register.update(register_params)
        format.html { redirect_to @register, notice: 'Register was successfully updated.' }
        format.json { render :show, status: :ok, location: @register }
      else
        format.html { render :edit }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register.destroy
    respond_to do |format|
      format.html { redirect_to registers_url, notice: 'Register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def check_fibo
      if params[:fibo]
        fib(params[:fibo].to_i)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params.permit(:email_address)
    end

  def resolve_layout
    case action_name
      when "create", "new"
        "registers"
      else
        "application"
    end
  end
end
