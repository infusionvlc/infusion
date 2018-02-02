# ~/test/models/identity_test.rb
# Actualmente:
#     - UID
require 'test_helper'

class IdentityTest < ActiveSupport::TestCase
  test 'Valid Identity' do
    user = users(:one)
    identity = Identity.new(user_id: user.id,
                            provider: 'ProviderTest', uid: 'TestUID')
    assert_equal identity.errors.count, 0
    puts '\nTest: Identity -> Valid Identity'
  end
  test 'Invalid without user' do
    identity = Identity.new(provider: 'ProviderTest', uid: 'TestUID')
    assert_not_equal identity.errors.count, 0,
    'Identity is valid without an User'
    puts '\nTest: Identity -> Invalid without User'
  end
  test 'Invalid if incomplete OAuth info without identity' do
    user = users(:one)
    identity = Identity.new(user_id: user.id, uid: 'TestUID')
    assert_not_equal identity.errors.count, 0,
    'Identity is valid without a Provider'
    puts '\nTest: Identity -> Invalid without Provider'
  end
  test 'Invalid if incomplete OAuth info without uid' do
    user = users(:one)
    identity = Identity.new(user_id: user.id, provider: 'ProviderTest')
    assert_not_equal identity.errors.count, 0,
    'Identity is valid without an UID'
    puts '\nTest: Identity -> Invalid without UID'
  end
  test 'Valid if not OAuth info without uid and identity' do
    user = users(:one)
    identity = Identity.new(user_id: user.id)
    assert_equal identity.errors.count, 0,
    'Identity is not valid without an UID and an Identity'
    puts '\nTest: Identity -> Valid without UID and Provider'
  end
end
