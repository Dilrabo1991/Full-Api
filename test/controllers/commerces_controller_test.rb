require "test_helper"

class CommercesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commerce = commerces(:one)
  end

  test "should get index" do
    get commerces_url, as: :json
    assert_response :success
  end

  test "should create commerce" do
    assert_difference("Commerce.count") do
      post commerces_url, params: { commerce: { brand: @commerce.brand, color: @commerce.color, department: @commerce.department, material: @commerce.material, price: @commerce.price, promotion_code: @commerce.promotion_code, vendor: @commerce.vendor } }, as: :json
    end

    assert_response :created
  end

  test "should show commerce" do
    get commerce_url(@commerce), as: :json
    assert_response :success
  end

  test "should update commerce" do
    patch commerce_url(@commerce), params: { commerce: { brand: @commerce.brand, color: @commerce.color, department: @commerce.department, material: @commerce.material, price: @commerce.price, promotion_code: @commerce.promotion_code, vendor: @commerce.vendor } }, as: :json
    assert_response :success
  end

  test "should destroy commerce" do
    assert_difference("Commerce.count", -1) do
      delete commerce_url(@commerce), as: :json
    end

    assert_response :no_content
  end
end
