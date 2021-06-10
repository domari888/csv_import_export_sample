class ImportController < ApplicationController
  def create
    file = params[:file]
    CSV.foreach(file.path, headers: true) do |row|
      User.create!(row.to_h)
    end
    redirect_to users_path
  end
end
