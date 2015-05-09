class FoodItemsGatherer
  def initialize(user:, status:)
    @user     = user
    @status   = status
    @gatherer = gatherer_factory
  end

  def food_items
    gatherer.food_items.ordered.limit(100)
  end

  def counts
    factory_mapper.inject({}) do |hash, (status, gatherer_class)|
      hash[status] = gatherer_class.new(user: user).count
      hash
    end
  end

  private
  attr_reader :user, :status, :gatherer

  def gatherer_factory
    factory_mapper[status].new(user: user)
  end

  def factory_mapper
    {
      all:      AllFoodItemsGatherer,
      eaten:    EatenFoodItemsGatherer,
      trashed:  TrashedFoodItemsGatherer,
      expiring: ExpiringFoodItemsGatherer
    }.with_indifferent_access
  end
end
