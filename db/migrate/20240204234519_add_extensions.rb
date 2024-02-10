class AddExtensions < ActiveRecord::Migration[7.1]
  def change
    enable_extension "fuzzystrmatch"
    enable_extension "pg_trgm"
    enable_extension "pgcrypto"
    enable_extension "unaccent"
  end
end
