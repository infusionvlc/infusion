# ~/test/models/identity_test.rb
# Actualmente:
#     - UID
require 'test_helper'

class IdentityTest < ActiveSupport::TestCase
  test 'Valid Identity' do
    user = users(:one)
    identity = Identity.new(user_id: user.id,
                            provider: 'ProviderTest', uid: 'TestUID')
    assert_equal identity.valid?, true
    puts 'Test: Identity -> Valid Identity'
  end
  test 'Invalid without user' do
    identity = Identity.new(provider: 'ProviderTest', uid: 'TestUID')
    assert_not_equal identity.valid?, true,
                     'Identity is valid without an User'
    puts 'Test: Identity -> Invalid without User'
  end
  test 'Invalid if incomplete OAuth info without identity' do
    user = users(:one)
    identity = Identity.new(user_id: user.id, uid: 'TestUID')
    assert_not_equal identity.valid?, true,
                     'Identity is valid without a Provider'
    puts 'Test: Identity -> Invalid without Provider'
  end
  test 'Invalid if incomplete OAuth info without uid' do
    user = users(:one)
    identity = Identity.new(user_id: user.id, provider: 'ProviderTest')
    assert_not_equal identity.valid?, true,
                     'Identity is valid without an UID'
    puts 'Test: Identity -> Invalid without UID'
  end
  test 'Valid if not OAuth info without uid and identity' do
    user = users(:one)
    identity = Identity.new(user_id: user.id)
    assert_not_equal identity.valid?, true,
    'Identity is not valid without an UID and an Provider'
    puts 'Test: Identity -> Valid without UID and Provider'
  end
end
