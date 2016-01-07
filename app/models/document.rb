class Document < ActiveRecord::Base
  attachment :document, extension: "pdf"
end
