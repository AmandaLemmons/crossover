require 'rails_helper'

RSpec.describe OrderLinesController, type: :routing do
  it { expect(get:    "/order_lines").to   route_to("order_lines#index") }
  it { expect(get:    "/order_lines/1").to route_to("order_lines#show", id: "1") }
  it { expect(post:   "/order_lines").to   route_to("order_lines#create") }
  it { expect(put:    "/order_lines/1").to route_to("order_lines#update", id: "1") }
  it { expect(delete: "/order_lines/1").to route_to("order_lines#destroy", id: "1") }
end
