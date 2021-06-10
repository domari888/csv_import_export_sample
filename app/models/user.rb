class User < ApplicationRecord

  # 受け取るパラメータを指定
  CSV_COLUMNS = %w[name age height].freeze
  
  def self.import_csv(file:)
    # トランザクション(CSV インポートの途中でエラーが出た場合はロールバック)
    User.transaction do
      CSV.foreach(file.path, headers: true) do |row|
        # User クラスのクラスメソッド内では User を省略できる
        # インポートで受け取れるカラムを制限(余計なものがあった際はエラーになりロールバック)
        # `*` は配列を展開する
        create!(row.to_h.slice(*CSV_COLUMNS))
      end
    end
  end
end
