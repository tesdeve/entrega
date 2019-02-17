require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { cost: @order.cost, delivery_address: @order.delivery_address, description: @order.description, dy_lat: @order.dy_lat, dy_lng: @order.dy_lng, dy_time: @order.dy_time, heigth: @order.heigth, length: @order.length, pickup_address: @order.pickup_address, pu_lat: @order.pu_lat, pu_lng: @order.pu_lng, pu_time: @order.pu_time, radius: @order.radius, sender_id: @order.sender_id, status: @order.status, transporter_id: @order.transporter_id, weight: @order.weight, width: @order.width } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { cost: @order.cost, delivery_address: @order.delivery_address, description: @order.description, dy_lat: @order.dy_lat, dy_lng: @order.dy_lng, dy_time: @order.dy_time, heigth: @order.heigth, length: @order.length, pickup_address: @order.pickup_address, pu_lat: @order.pu_lat, pu_lng: @order.pu_lng, pu_time: @order.pu_time, radius: @order.radius, sender_id: @order.sender_id, status: @order.status, transporter_id: @order.transporter_id, weight: @order.weight, width: @order.width } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
