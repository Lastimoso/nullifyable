require "test_helper"

class NullifyableTest < Minitest::Test
  def setup
    setup_db
  end

  def teardown
    teardown_db
  end

  def test_that_it_has_a_version_number
    refute_nil ::Nullifyable::VERSION
  end

  def test_it_nullify_blank_string
    user = User.create!(email: "test@email.com", first_name: "")
    assert_nil user.first_name
  end

  def test_it_nullify_blank_string_for_ar_store
    user = User.create!(email: "test@email.com", external_id: "")
    assert_nil user.external_id
  end

  def test_it_nullify_space_string
    user = User.create!(email: "test@email.com", first_name: " ")
    assert_nil user.first_name
  end

  def test_it_nullify_space_string_for_ar_store
    user = User.create!(email: "test@email.com", external_id: " ")
    assert_nil user.external_id
  end

  def test_it_does_not_nullify_zero
    user = User.create!(email: "test@email.com", first_name: 0)
    assert_equal "0", user.first_name
  end

  def test_it_does_not_nullify_zero_for_ar_store
    user = User.create!(email: "test@email.com", external_id: 0)
    assert_equal 0, user.external_id
  end

  def test_it_nullify_multiple_attributes
    user = User.create!(email: "test@email.com", first_name: "", last_name: "")
    assert_nil user.first_name
    assert_nil user.last_name
  end
end
