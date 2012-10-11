module ActiveRecord
  module ConnectionAdapters # :nodoc:
    module SchemaStatements
      def index_name(table_name, options) #:nodoc:
        if Hash === options # legacy support
          if options[:column]
            "#{Array.wrap(options[:column]) * '_and_'}"
          elsif options[:name]
            options[:name]
          else
            raise ArgumentError, "You must specify the index name"
          end
        else
          index_name(table_name, :column => options)
        end
      end
    end
  end
end

