# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#icon_for' do
    let(:icon_for) { helper.icon_for(icon_name) }
    let(:icon) { instance_spy(Icon) }

    context "when icon_name is 'foo'" do
      let(:icon_name) { :foo }

      before { allow(Icon).to receive(:new).with(icon_name: icon_name).and_return(icon) }

      specify do
        expect(icon).to receive(:render).with(no_args)

        icon_for
      end
    end
  end

  describe '#badge_for' do
    let(:badge_for) { helper.badge_for(count: count) }

    context 'when count is 3' do
      let(:count) { 3 }

      specify { expect(badge_for).to have_css('span.badge', text: count) }
    end
  end
end
