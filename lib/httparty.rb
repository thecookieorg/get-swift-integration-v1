require 'httparty'

class Delivery
	include HTTParty

	@api_key = "cb8d3966-e1c6-4429-a8cf-b615523481c4"

	#HTTParty.post("https://app.getswift.co/api/v2/deliveries",
	#		  {
	#		  	:body => [ { "apiKey" => api_key, "booking" => [ { "pickupDetails" => { "301 Maude Road, Port Moody, V3H 5B1" }, "dropoffDetail" => { "7225 Acorn Avenue, Burnaby, V5E 0A9" },  }] }].to_json,
	#		  	:headers => { 'Content-Type' => 'application/json' }
	#		  }
	#	)



end