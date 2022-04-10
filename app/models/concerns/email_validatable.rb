module EmailValidatable
  extend ActiveSupport::Concern

  # [半角英数と許可された記号の文字列(先頭と末尾は記号不可)] + [@] + 「1つ以上の[半角英小文字の1つ以上のサブドメイン] + [.]」 + [半角英小文字のドメイン] の形式のみ許可する。
  EMAIL_REGEXP = /\A([a-zA-Z0-9]{1})([\w+.-]+)([a-zA-Z0-9]{1})@([a-z]+\.)+([a-z]+)\z/.freeze

  # テストケース
  # test@example.com
  # test@examplecom
  # testexample.com
  # testexamplecom
  #
  # Atest@example.com
  # 1test@example.com
  # _test@example.com
  # +test@example.com
  # .test@example.com
  # -test@example.com
  # !test@example.com
  #
  # tAtest@example.com
  # t1test@example.com
  # t_test@example.com
  # t+test@example.com
  # t.test@example.com
  # t-test@example.com
  # t!test@example.com
  #
  # testA@example.com
  # test1@example.com
  # test_@example.com
  # test+@example.com
  # test.@example.com
  # test-@example.com
  # test!@example.com
  #
  # test@Aexample.com
  # test@1example.com
  # test@_example.com
  # test@+example.com
  # test@.example.com
  # test@-example.com
  # test@!example.com
  #
  # test@eAxample.com
  # test@e1xample.com
  # test@e_xample.com
  # test@e+xample.com
  # test@e.xample.com
  # test@e-xample.com
  # test@e!xample.com
  #
  # test@example.cAom
  # test@example.c1om
  # test@example.c_om
  # test@example.c+om
  # test@example.c.om
  # test@example.c-om
  # test@example.c!om
  # test@example.c..m
  # test@example.c.om.

  included do
    validates :email, length: { maximum: 255 }, format: { with: REGEXP }, if: -> { email.present? }
  end
end
