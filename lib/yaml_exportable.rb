module YamlExportable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def yaml_export
      cols = column_names - ["created_at", "updated_at"]
      query = respond_to?(:with_deleted) ? scoped.with_deleted : scoped

      YamlExportable.write_yaml(self.table_name) do |f|
        query.find_each do |row|
          buff = []
          buff << "#{table_name}_#{row.id}:"
          buff << cols.map{|col| "  #{col}: #{YamlExportable.yaml_escape(row.read_attribute(col))}\n"}.join
          f.puts(buff.join("\n") + "\n")
        end
      end
    end
  end

  def self.write_yaml(table_name, &block)
    seed_file = File.join(Rails.root, "spec", "fixtures", "#{table_name}.yml")
    FileUtils.mkdir_p(File.dirname(seed_file))
    File.open(seed_file, "w") do |f|
      f.puts "---\n" # start document
      yield f
    end
  end

  def self.yaml_escape(value)
    case value
    when NilClass
      return "null"
    when Fixnum, Float, TrueClass, FalseClass
      return value.to_s
    when Time
      return value.localtime.strftime("%Y-%m-%d %H:%M:%S +09:00")
    end

    if !!(value =~ /\n/)
      # multiline
      "|2-\n".tap do |ret|
        ret << value.strip.each_line.map{|line| "    " << line.rstrip}.join("\n")
      end
    elsif /\A[A-Z][a-zA-Z\d\-\_:]*\s*\Z/ =~ value.to_s
      # modulize
      value
    else
      # oneline
      JSON.dump(value)
    end
  end
end

