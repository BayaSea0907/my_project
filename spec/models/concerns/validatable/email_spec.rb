require 'rails_helper'

RSpec.describe 'Validatable::Email', type: :model do
  describe '#email_required?がtrueを返す場合' do
    it 'emailがnilなら無効' do
      model_class = Class.new do
        include ActiveModel::Model
        include Validatable::Email

        attr_accessor :email

        private

        def email_required?
          true
        end
      end

      expect(model_class.new(email: nil)).to be_invalid
    end
  end

  describe '#email_required?がfalseを返す場合' do
    it 'emailがnilなら有効' do
      model_class = Class.new do
        include ActiveModel::Model
        include Validatable::Email

        attr_accessor :email

        private

        def email_required?
          false
        end
      end

      expect(model_class.new(email: nil)).to be_valid
    end
  end

  context 'emailが与えられた場合' do
    let!(:model_class) do
      Class.new do
        include ActiveModel::Model
        include Validatable::Email

        attr_accessor :email

        private

        def email_required?
          true
        end
      end
    end

    it '256文字以上なら無効' do
      valid_email = 'test@example.jp' # 15文字

      expect(model_class.new(email: ('a' * 240) + valid_email)).to be_valid
      expect(model_class.new(email: ('a' * 241) + valid_email)).to be_invalid
    end

    it '許可されたフォーマットなら有効' do
      expect(model_class.new(email: 'test@example.com')).to be_valid
      expect(model_class.new(email: 'Atest@example.com')).to be_valid
      expect(model_class.new(email: '1test@example.com')).to be_valid
      expect(model_class.new(email: 'tAtest@example.com')).to be_valid
      expect(model_class.new(email: 't1test@example.com')).to be_valid
      expect(model_class.new(email: 't_test@example.com')).to be_valid
      expect(model_class.new(email: 't+test@example.com')).to be_valid
      expect(model_class.new(email: 't++test@example.com')).to be_valid
      expect(model_class.new(email: 't.test@example.com')).to be_valid
      expect(model_class.new(email: 't-test@example.com')).to be_valid
      expect(model_class.new(email: 't--test@example.com')).to be_valid
      expect(model_class.new(email: 'testA@example.com')).to be_valid
      expect(model_class.new(email: 'test1@example.com')).to be_valid
      expect(model_class.new(email: 'test@e.xample.com')).to be_valid
      expect(model_class.new(email: 'test@example.c.om')).to be_valid

      expect(model_class.new(email: 'te..st@example.com')).to be_invalid
      expect(model_class.new(email: 'test@examplecom')).to be_invalid
      expect(model_class.new(email: 'testexample.com')).to be_invalid
      expect(model_class.new(email: 'testexamplecom')).to be_invalid
      expect(model_class.new(email: '_test@example.com')).to be_invalid
      expect(model_class.new(email: '+test@example.com')).to be_invalid
      expect(model_class.new(email: '.test@example.com')).to be_invalid
      expect(model_class.new(email: '-test@example.com')).to be_invalid
      expect(model_class.new(email: '!test@example.com')).to be_invalid
      expect(model_class.new(email: 't..test@example.com')).to be_invalid
      expect(model_class.new(email: 't!test@example.com')).to be_invalid
      expect(model_class.new(email: 'test_@example.com')).to be_invalid
      expect(model_class.new(email: 'test+@example.com')).to be_invalid
      expect(model_class.new(email: 'test++@example.com')).to be_invalid
      expect(model_class.new(email: 'test.@example.com')).to be_invalid
      expect(model_class.new(email: 'test..@example.com')).to be_invalid
      expect(model_class.new(email: 'test-@example.com')).to be_invalid
      expect(model_class.new(email: 'test--@example.com')).to be_invalid
      expect(model_class.new(email: 'test!@example.com')).to be_invalid
      expect(model_class.new(email: 'test@Aexample.com')).to be_invalid
      expect(model_class.new(email: 'test@1example.com')).to be_invalid
      expect(model_class.new(email: 'test@_example.com')).to be_invalid
      expect(model_class.new(email: 'test@+example.com')).to be_invalid
      expect(model_class.new(email: 'test@.example.com')).to be_invalid
      expect(model_class.new(email: 'test@-example.com')).to be_invalid
      expect(model_class.new(email: 'test@!example.com')).to be_invalid
      expect(model_class.new(email: 'test@eAxample.com')).to be_invalid
      expect(model_class.new(email: 'test@e1xample.com')).to be_invalid
      expect(model_class.new(email: 'test@e_xample.com')).to be_invalid
      expect(model_class.new(email: 'test@e+xample.com')).to be_invalid
      expect(model_class.new(email: 'test@e-xample.com')).to be_invalid
      expect(model_class.new(email: 'test@e!xample.com')).to be_invalid
      expect(model_class.new(email: 'test@example.cAom')).to be_invalid
      expect(model_class.new(email: 'test@example.c1om')).to be_invalid
      expect(model_class.new(email: 'test@example.c_om')).to be_invalid
      expect(model_class.new(email: 'test@example.c+om')).to be_invalid
      expect(model_class.new(email: 'test@example.c-om')).to be_invalid
      expect(model_class.new(email: 'test@example.c!om')).to be_invalid
      expect(model_class.new(email: 'test@example.c..m')).to be_invalid
      expect(model_class.new(email: 'test@example.c.om.')).to be_invalid
    end
  end
end
