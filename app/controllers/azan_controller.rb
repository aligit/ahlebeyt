class AzanController < ApplicationController
  def index
  end

  def download
     send_file params[:filename]
  end
end
