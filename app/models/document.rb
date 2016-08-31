class Document < ActiveRecord::Base
  attachment :document, extension: 'pdf'
  default_scope { order(created_at: :desc) }
end
