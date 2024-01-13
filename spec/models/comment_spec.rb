require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { described_class.new(text: 'text') }

  context 'testing the comment ' do
    it 'validates that text should not be blank' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end
end
