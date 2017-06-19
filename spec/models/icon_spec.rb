# frozen_string_literal: true

require 'rails_helper'
require Rails.root.join('app/models/icon')

RSpec.describe Icon do
  let(:icon) { described_class.new(icon_name: icon_name) }

  describe '#render' do
    subject { icon.render }

    context 'for the add icon' do
      let(:icon_name) { :add }

      it do
        expect(icon).to receive(:content_tag).with(:i, nil, class: 'fa fa-plus')
        subject
      end
    end

    context 'for the eaten icon' do
      let(:icon_name) { :eaten }

      it do
        expect(icon).to receive(:content_tag).with(:i, nil, class: 'fa fa-cutlery')
        subject
      end
    end

    context 'for the edit icon' do
      let(:icon_name) { :edit }

      it do
        expect(icon).to receive(:content_tag).with(:i, nil, class: 'fa fa-edit')
        subject
      end
    end

    context 'for the trash icon' do
      let(:icon_name) { :trash }

      it do
        expect(icon).to receive(:content_tag).with(:i, nil, class: 'fa fa-trash-o')
        subject
      end
    end
  end
end
