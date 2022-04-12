require 'rails_helper'

RSpec.describe Article, type: :model do
  # TODO: factory-botを導入する
  xdescribe 'バリデーション' do
    describe 'title' do
      it 'nilなら無効' do
        expect(described_class.new(title: nil)).to be_invalid
      end

      it '256文字以上なら無効' do
        expect(described_class.new(title: 'a' * 255)).to be_valid
        expect(described_class.new(title: 'a' * 256)).to be_invalid
      end
    end

    describe 'content' do
      it 'nilなら無効' do
        expect(described_class.new(title: nil)).to be_invalid
      end

      it '49文字以下なら無効' do
        expect(described_class.new(content: 'a' * 49)).to be_invalid
        expect(described_class.new(content: 'a' * 50)).to be_valid
      end
    end
  end
end
