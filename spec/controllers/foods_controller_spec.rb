# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FoodsController do
  before { get :index, params: params, session: { user_id: user.id } }

  let(:user) { FactoryGirl.create(:user) }

  describe 'GET index' do
    context 'when passing a valid status' do
      let(:params) { { status: :all } }

      describe 'filters' do
        specify { expect(assigns(:filters)).to contain_exactly('all', 'eaten', 'expiring', 'trashed') }
      end
    end
  end
end
