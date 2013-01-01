class Document
  include Mongoid::Document
  include Mongoid::Lock
  
  field :title, type: String
  
  self.timeout = 1
  
end
