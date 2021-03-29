require 'rails_helper'

describe Cookie do
  subject { Cookie.new }

  describe "associations" do
    it { is_expected.to belong_to(:storage) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:storage) }
  end
  
  describe "after_create" do
    let(:cookie) { create(:cookie) }

    it 'is not ready' do
      expect(cookie.ready?).not_to be_true
    end
  end
end
