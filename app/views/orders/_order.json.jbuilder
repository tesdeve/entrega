json.extract! order, :id, :description, :weight, :length, :width, :heigth, :pickup_address, :pu_lat, :pu_lng, :pu_time, :delivery_address, :dy_lat, :dy_lng, :dy_time, :cost, :status, :radius, :sender_id, :transporter_id, :created_at, :updated_at
json.url order_url(order, format: :json)
