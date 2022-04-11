require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    describe 'email' do
      it 'nilなら無効' do
        expect(described_class.new(email: nil)).to be_invalid
      end

      it '256文字以上なら無効' do
        valid_email = 'test@example.jp' # 15文字

        expect(described_class.new(email: ('a' * 240) + valid_email)).to be_valid
        expect(described_class.new(email: ('a' * 241) + valid_email)).to be_invalid
      end

      it '許可されたフォーマットなら有効' do
        expect(described_class.new(email: 'test@example.com')).to be_valid
        expect(described_class.new(email: 'test+alias-name_2@example.com')).to be_valid
      end
    end
  end
end
