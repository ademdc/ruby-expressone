module RubyExpressOne
  class Connection

    attr_reader :client, :api_key

    def initialize(api_key, with_logger: false)
      @api_key = api_key

      @client = RubyExpressOne::Client.new(api_key, with_logger: with_logger)
    end

    def get_shipment(id)
      query_params = { ShipmentId: id }
      
      action("/GetShipmentStatusByShipmentId", http_method: :get, query_params: query_params)
    end

    def create_shipment(payload, plain: true)

      path = plain ? '/CreateShipmentPlain' : '/CreateShipment'

      action(path, payload: payload)
    end

    def confirm_shipment(trackingNumber)
      action("/api/shipments/confirmshipments?trackingNumber=#{trackingNumber}", http_method: :put)
    end

    def update_shipment(id, payload)
      action("/api/shipments/#{id}", payload: payload, http_method: :patch)
    end

    def get_shipment_events(id)
      action("/api/shipments/#{id}/shipmentevents", http_method: :get)
    end

    private

    def action(path, payload: {}, http_method: :post, query_params: {})
      client.action(path, payload: payload, http_method: http_method, query_params: query_params)
    end
  end
end