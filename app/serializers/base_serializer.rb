class BaseSerializer < ActiveModel::Serializer
  def self.serialize(data)
    if data.respond_to?(:map)
      serialized_data = data.map { |item| self.new item }
    else
      serialized_data = self.new data
    end
    serialized_data
  end
end
