module Validatable
  module Email
    extend ActiveSupport::Concern

    # メールアドレスのフォーマット参考:
    #   https://en.wikipedia.org/wiki/Email_address
    # ローカル部:
    #   先頭と末尾はドットが使えないことと、記号を使って欲しくない理由から半角英数のみ許可。
    #   先頭と末尾の間の文字は半角英数と、よく利用されると思われる記号のみを許可。
    #   なお、連続した「.」は禁止されているが正規表現で考慮できていないため、inclusion validatorで排除しています。
    LOCAL_PART_REGEXP_STR = '([a-zA-Z0-9])([\w+.-]?[\w+-]*)([a-zA-Z0-9])'
    # ドメイン:
    #   半角英小文字のみを許可。
    DOMAIN_REGEXP_STR = '([a-z]+[.])+([a-z]+)'
    EMAIL_ADDRESS_REGEXP = /\A#{LOCAL_PART_REGEXP_STR}@#{DOMAIN_REGEXP_STR}\z/

    included do
      validates :email, presence: { if: :email_required? }
      validates :email, length: { maximum: 255 }, format: { with: EMAIL_ADDRESS_REGEXP }, if: -> { email.present? }
    end

    private

    def email_required?
      true
    end
  end
end
