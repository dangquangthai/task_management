require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '.enumeration' do
    it do 
      is_expected.to enumerize(:status)
        .in(%i[open inprogress closed])
        .with_scope(true)
        .with_default(:open)
        .with_predicates(true)
    end
  end

  describe '.validation' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(40) }
  end

  describe '.associations' do
    it { is_expected.to belong_to(:user) }
  end
end
