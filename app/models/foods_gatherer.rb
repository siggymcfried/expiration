# frozen_string_literal: true

class FoodsGatherer
  def initialize(user:, status:, page:)
    @user     = user
    @status   = status
    @page     = page
    @gatherer = gatherer_factory
  end

  def foods
    gatherer.foods.ordered.page(page)
  end

  def counts
    factory_mapper.each_with_object({}) do |(status, gatherer_class), hash|
      hash[status] = gatherer_class.new(user: user).count
    end.with_indifferent_access
  end

  private
  attr_reader :user, :status, :page, :gatherer

  def gatherer_factory
    factory_mapper[status].new(user: user)
  end

  def factory_mapper
    {
      all:      AllFoodsGatherer,
      eaten:    EatenFoodsGatherer,
      trashed:  TrashedFoodsGatherer,
      expiring: ExpiringFoodsGatherer
    }.with_indifferent_access
  end
end
