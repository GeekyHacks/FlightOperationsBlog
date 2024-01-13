require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'name', photo: 'photo url', bio: 'this is the bio') }

  context 'testing the user data entered' do
    it 'validates that name should not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
  context 'testing the posts_counter' do
    it 'validates that posts_counter is not blank' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end
    it 'validates that posts_counter is greater or equal to zero' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
