# frozen_string_literal: true

require 'rails_helper'
require Rails.root.join('app/models/icon')

RSpec.describe Icon do
  let(:icon) { described_class.new(icon_name: icon_name) }

  describe '#render' do
    context 'with the add icon' do
      let(:icon_name) { :add }

      it do
        expect(icon).to receive(:content_tag).with(:i, nil, class: 'fa fa-plus')

        icon.render
      end
    end

    context 'with the eaten icon' do
      let(:icon_name) { :eaten }

      it do
        expect(icon).to receive(:content_tag).with(:i, nil, class: 'fa fa-cutlery')

        icon.render
      end
    end

    context 'with the edit icon' do
      let(:icon_name) { :edit }

      it do
        expect(icon).to receive(:content_tag).with(:i, nil, class: 'fa fa-edit')

        icon.render
      end
    end

    context 'with the trash icon' do
      let(:icon_name) { :trash }

      it do
        expect(icon).to receive(:content_tag).with(:i, nil, class: 'fa fa-trash-o')

        icon.render
      end
    end
  end
end
