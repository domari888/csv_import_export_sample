class ImportController < ApplicationController
  def create
    # CSV ファイルを選択している時のみインポートすることができる、そうでない場合はリダイレクト
    User.import_csv(file: params[:file]) if params[:file].present?
    redirect_to users_path
  end
end
