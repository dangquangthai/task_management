require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.validation' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username).ignoring_case_sensitivity }
    it { is_expected.to validate_length_of(:username).is_at_least(8) }
    it { is_expected.to validate_length_of(:username).is_at_most(16) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
    it { is_expected.to validate_length_of(:password).is_at_most(16) }

    describe '#username' do
      context 'when username contains special characters' do
        subject { build(:user, username: 'thai.dang') }

        it 'should invalid' do
          expect(subject.valid?).to be false
          expect(subject.errors.messages).to eq({ username: ['is invalid'] })
        end
      end

      context 'when username not contains any special characters' do
        subject { build(:user, username: 'thaidang') }

        it { expect(subject.valid?).to be true }
      end
    end

    describe '#password' do
      context 'invalid' do
        context 'when password not contains any upper case characters' do
          subject { build(:user, password: 'p@ssword123') }

          it 'should invalid' do
            expect(subject.valid?).to be false
            expect(subject.errors.messages).to eq({ password: ['is invalid'] })
          end
        end

        context 'when password not contains any number' do
          subject { build(:user, password: 'p@ssWordedc') }

          it 'should invalid' do
            expect(subject.valid?).to be false
            expect(subject.errors.messages).to eq({ password: ['is invalid'] })
          end
        end

        context 'when password not contains any special characters' do
          subject { build(:user, password: 'passWord123') }

          it 'should invalid' do
            expect(subject.valid?).to be false
            expect(subject.errors.messages).to eq({ password: ['is invalid'] })
          end
        end
      end

      context 'valid' do
        subject { build(:user) }

        it { expect(subject.valid?).to be true }
      end
    end
  end

  describe '.associations' do
    it { is_expected.to have_many(:tasks) }
  end
end
