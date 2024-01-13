require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new(title: 'title', text: 'text') }

  context 'testing the post data ' do
    it 'validates that title should not be blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it 'validates that text should not greater than 250' do
      subject.text.length > 250
      expect(subject).to_not be_valid
    end
    it 'validates that text should not be blank' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end

  context 'testing the comments_counter' do
    it 'validates that comments_counter is not blank' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end
    it 'validates that comments_counter is greater or equal to zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end
  end
  context 'testing the likes_counter' do
    it 'validates that likes_counter is not blank' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end
    it 'validates that likes_counter is greater or equal to zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
