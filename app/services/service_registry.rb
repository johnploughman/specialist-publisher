require "publish_document_service"
require "update_document_service"
require "create_document_service"
require "withdraw_document_service"

class ServiceRegistry

  def initialize(document_builder, document_repository, publication_listeners, creation_listeners, withdrawal_listeners)
    @document_builder = document_builder
    @document_repository = document_repository
    @publication_listeners = publication_listeners
    @creation_listeners = creation_listeners
    @withdrawal_listeners = withdrawal_listeners
  end

  def create_document(context)
    CreateDocumentService.new(
      document_builder,
      document_repository,
      creation_listeners,
      context,
    )
  end

  def publish_document(context)
    PublishDocumentService.new(
      document_repository,
      publication_listeners,
      context,
    )
  end

  def update_document(context)
    UpdateDocumentService.new(
      document_repository,
      [],
      context,
    )
  end

  def withdraw_document(context)
    WithdrawDocumentService.new(
      document_repository,
      withdrawal_listeners,
      context,
    )
  end

  def create_manual_document(context)
    CreateDocumentService.new(
      document_builder,
      document_repository,
      [],
      context,
    )
  end

  private

  attr_reader(
    :document_builder,
    :document_repository,
    :publication_listeners,
    :creation_listeners,
    :withdrawal_listeners,
  )
end
