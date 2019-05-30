class Product < ApplicationRecord
  # Downloadするためのメソッド
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      product = self.find_or_initialize_by(id: row["id"])
      product.attributes = row.to_hash
      product.save!
    end
  end

end
