class AbstractAppModel < ActiveRecord::Base
  self.abstract_class = true

  include YamlExportable
end

