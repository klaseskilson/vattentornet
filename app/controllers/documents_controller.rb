class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new document_params

    if @document.save!
      redirect_to documents_path, notice: "Dokumentet har laddats upp"
    else
      redirect_to new_document_path, notice: "Dokumentet kunde inte skapas..."
    end
  end

  private

  def document_params
    params.require(:document).permit(:name, :document)
  end
end
