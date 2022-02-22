require 'test_helper'

class I18nBackendEnvVarLookupTest < Test::Unit::TestCase
  class Backend < I18n::Backend::Simple
    include I18n::Backend::EnvVarLookup
  end

  def setup
    ENV['APP_NAME'] = 'Foo Bar'
    I18n.backend = Backend.new
    I18n.backend.store_translations(:en,
      :foo => 'foo',
      :bar => {
        :baz => 'bar ~{APP_NAME}',
        :boo => {
          :baz => 'hoo ~{APP_NAME}'
        }
      }
    )
  end

  def teardown
    I18n.backend = nil
  end

  test "still returns an existing translation as usual" do
    assert_equal 'foo', I18n.t(:foo)
  end

  test "still fails for a missing key" do
    assert_equal 'translation missing: en.missing_key', I18n.t(:'missing_key')
  end

  test "does a lookup on an embedded key" do
    assert_equal 'bar Foo Bar', I18n.t(:'bar.baz')
    assert_equal 'hoo Foo Bar', I18n.t(:'bar.boo.baz')
  end

  test "stores a compiled lookup" do
    original_lookup = I18n::Backend::Simple.instance_method(:lookup).bind(I18n.backend)

    result = I18n.t(:'bar.baz')
    precompiled_result = original_lookup.call(:en, :'bar.baz')
    assert_equal result, precompiled_result
  end
end
