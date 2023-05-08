class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  before_create :generate_uuid

  private

  def generate_uuid
    uuid = SecureRandom.uuid
    self.id = uuid
  end
end
