# frozen_string_literal: true

require 'rails_helper'
require Rails.root.join('app/models/icon')

RSpec.describe Icon do
  let(:icon) { described_class.new(icon_name: icon_name) }

  describe '#render' do
    context 'with the add icon' do
      let(:icon_name) { :add }

      it do
        expect(icon.render).to eq('<i class="fa fa-plus"></i>')
      end
    end

    context 'with the eaten icon' do
      let(:icon_name) { :eaten }

      it do
        expect(icon.render).to eq('<i class="fa fa-cutlery"></i>')
      end
    end

    context 'with the edit icon' do
      let(:icon_name) { :edit }

      it do
        expect(icon.render).to eq('<i class="fa fa-edit"></i>')
      end
    end

    context 'with the trash icon' do
      let(:icon_name) { :trash }

      it do
        expect(icon.render).to eq('<i class="fa fa-trash-o"></i>')
      end
    end
  end
end
