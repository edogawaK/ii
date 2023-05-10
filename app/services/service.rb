class Service
  attr_accessor :record_per_query, :offset, :order, :sort

  def initialize()
    @record_per_query = 20
    @offset = 0
    @order = "asc"
    @sort = nil
  end
end
