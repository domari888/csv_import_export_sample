class User < ApplicationRecord

  # 受け取るパラメータを指定
  CSV_COLUMNS = %w[name age height].freeze
  
  def self.import_csv(file:)
    now = Time.current
    timestamp_attributes = {created_at: now, updated_at: now}
    list = []
    CSV.foreach(file.path, headers: true) do |row|
        # インポートで受け取れるカラムを制限(余計なものがあった際はエラー)
        # `*` は配列を展開する
        list << row.to_h.slice(*CSV_COLUMNS).merge(timestamp_attributes)
    end
      # User モデルにバルクインサート(まとめて追加)
    User.insert_all(list)
  end
end
