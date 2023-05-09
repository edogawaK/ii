class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  before_create :generate_uuid

  enum status: {
    active: 1,
    inactive: 0,
  }

  def serialize(attributes)
    serialized_data = {}

    attributes.each do |attribute|
      serialized_data[attribute] = (self.send(attribute))
    end

    serialized_data
  end

  private

  def generate_uuid
    uuid = SecureRandom.uuid
    self.id ||= uuid
  end
end
