# frozen_string_literal: true

class FoodsGatherer
  def initialize(user:, status:, page:)
    @user     = user
    @status   = status
    @page     = page
  end

  def foods
    gatherer.foods.ordered.page(page)
  end

  def counts
    factory_mapper.transform_values do |gatherer_class|
      gatherer_class.new(user: user).count
    end.with_indifferent_access
  end

  private
  attr_reader :user, :status, :page

  def gatherer
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
