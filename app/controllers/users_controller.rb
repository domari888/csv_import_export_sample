class UsersController < ApplicationController
  def index
    @users = User.order(id: :asc)
    respond_to do |format|
      format.html
      format.csv do
        send_data(@users.generate_csv, filename: "users.csv")
      end
    end
  end
end
