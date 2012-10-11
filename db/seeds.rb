# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SEED_DIR = File.join(Rails.root, 'db', 'seeds')

# load yaml data like csv
def read_yaml_file(file_path)
  rows = YAML.load(render(IO.read(file_path))).values
  header = rows.first.keys
  rows = rows.map {|row| row.values_at(*header) }
  rows.unshift(header)
end

# eval erb
def render(content)
  ERB.new(content).result
end

# bulk insert
def insert_rows(klass, rows)
  header = rows.shift.map(&:strip)
  until rows.blank?
    r = rows.slice!(0, 1000)
    klass.import(header, r, on_duplicate_key_update: header - ["id", "created_at"], validate: false)
  end
end

# delete_all and insert fixture_file
def seed_table(fixture_file)
  table_name = File.basename(fixture_file, '.*')
  ActiveRecord::Migration.say_with_time(table_name) do
    ActiveRecord::Base.transaction do
      # acts_as_paranoid
      klass = table_name.classify.constantize
      klass.respond_to?(:delete_all!) ? klass.delete_all! : klass.delete_all
      insert_rows(klass, read_yaml_file(fixture_file))
    end
  end
end

def main
  table_names = ENV['TABLES'] ? ENV['TABLES'].split(',') : []

  fixture_files = if table_names.empty?
                    Dir.glob(File.join(SEED_DIR, "*.yml"))
                  else
                    Dir.glob(File.join(SEED_DIR, "{#{table_names.join(",")}}.yml"))
                  end

  fixture_files.each do |fixture_file|
    seed_table(fixture_file)
  end
end

main

