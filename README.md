# ExpressOne Ruby
Ruby client for ExpressOne shipment tracker and parcel creator

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ruby-expressone', '0.0.1'
```

...followed with:
```
bundle install
```

Or install it with:
```
gem install ruby-expressone
```

## Usage
```
connection = RubyExpressOne::Connection.new(api_key)
```

### Get shipment

```
connection.get_shipment(id)
```

### Create shipment

```
opts = {
  "NumberOfCollies": 1,
  "Weight": null,
  "OverseasPrintsShippingLabels": false,
  "Ref1": "Text value",
  "Ref2": "Text value",
  "Ref3": "Text value",
  "RemarkGoods": "Text value",
  "CountOfBillingUnits": null,
  "ConsigneeName": "Text value",
  "ConsigneePostalCode": "Text value",
  "ConsigneeStreet": "Text value",
  "ConsigneeCity": "Text value",
  "ConsigneeCountryPrefix": "HR",
  "ConsigneeTelephoneNumber": "Text value",
  "ConsigneeFaxNumber": "Text value",
  "ConsigneeGsmNumber": "Text value",
  "ConsigneeEmailAddress": "Text value",
  "SenderName": "Text value",
  "SenderPostalCode": "Text value",
  "SenderStreet": "Text value",
  "SenderCity": "Text value",
  "SenderCountryPrefix": "HR",
  "SenderTelephoneNumber": "Text value",
  "SenderFaxNumber": "Text value",
  "SenderGsmNumber": "Text value",
  "SenderEmailAddress": "Text value",
  "ExpressType": 100,
  "ExWorksType": null,
  "NotificationType": 3,
  "AllowSaturdayDelivery": false,
  "PickupStart": null,
  "PickupEnd": null,
  "DeliveryStart": null,
  "DeliveryEnd": null,
  "CodAmount": null,
  "CodCurrency": null,
  "InsuranceAmount": null,
  "Currency": null,
  "RemarkDelivery": "Text value",
  "RemarkPickup": "Text value",
  "IsCargo": false,
  "ReturnDocument": false,
  "BillingUnit": null,
  "ShipmentDocumentData": null,
  "ShipmentDocumentExtension": null,
  "ApiKey": "00000000-0000-0000-0000-000000000000"
}

connection.create_shipment(opts)
```

### Confirm shipment by tracking number

```
connection.confirm_shipment(tracking_number)
```


## Thank you for using RubyExpressOne!


