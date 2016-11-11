class NullContactsController < ApplicationController
  before_action :set_null_contact, only: [:show, :edit, :update, :destroy]

  # GET /null_contacts
  # GET /null_contacts.json
  def index
    @null_contacts = NullContact.all
  end

  # GET /null_contacts/1
  # GET /null_contacts/1.json
  def show
  end

  # GET /null_contacts/new
  def new
    @null_contact = NullContact.new
  end

  # GET /null_contacts/1/edit
  def edit
  end

  # POST /null_contacts
  # POST /null_contacts.json
  def create
    @null_contact = NullContact.new(null_contact_params)

    respond_to do |format|
      if @null_contact.save
        format.html { redirect_to @null_contact, notice: 'Null contact was successfully created.' }
        format.json { render :show, status: :created, location: @null_contact }
      else
        format.html { render :new }
        format.json { render json: @null_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /null_contacts/1
  # PATCH/PUT /null_contacts/1.json
  def update
    respond_to do |format|
      if @null_contact.update(null_contact_params)
        format.html { redirect_to @null_contact, notice: 'Null contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @null_contact }
      else
        format.html { render :edit }
        format.json { render json: @null_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /null_contacts/1
  # DELETE /null_contacts/1.json
  def destroy
    @null_contact.destroy
    respond_to do |format|
      format.html { redirect_to null_contacts_url, notice: 'Null contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_null_contact
      @null_contact = NullContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def null_contact_params
      params.require(:null_contact).permit(:firstname, :lastname, :email, :status, :import_id)
    end
end
