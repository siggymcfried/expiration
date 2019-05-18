# frozen_string_literal: true

class ExpirationDatesController < ApplicationController
  def show
    render json: { expires_on: ExpirationDate.new(params[:id]).calculate }
  end
end
