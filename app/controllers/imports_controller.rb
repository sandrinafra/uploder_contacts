class ImportsController < ApplicationController
  include ImportsHelper
  before_action :set_import, only: [:show, :destroy]

  # GET /imports
  # GET /imports.json
  def index
    @imports = Import.all
    @import = Import.new
  end

  # GET /imports/new
  def new
    @import = Import.new
  end

  # POST /imports
  # POST /imports.json
  def create
    file = params[:import][:file] if params[:import]
    @import = Import.new(file: file)
    respond_to do |format|
      if @import.save
        xlsx_process
        format.html { redirect_to @import, notice: 'Import was successfully created.' }
        format.json { render :show, status: :created, location: @import }
      else
        @import.errors.each do |attr, msg|
        end
        format.html { redirect_to imports_path }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imports/1
  # DELETE /imports/1.json
  def destroy
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url, notice: 'Import was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_import
      @import = Import.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def import_params
      params.require(:import).permit(:file)
    end
end
