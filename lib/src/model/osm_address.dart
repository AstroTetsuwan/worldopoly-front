class OsmAddress {
  final String road;
  final String suburb;
  final String cityDistrict;
  final String city;
  final String state;
  final String region;
  final String postcode;
  final String country;
  final String countryCode;

  OsmAddress({
    required this.road,
    required this.suburb,
    required this.cityDistrict,
    required this.city,
    required this.state,
    required this.region,
    required this.postcode,
    required this.country,
    required this.countryCode
  });
  
  factory OsmAddress.fromJson(Map<String, dynamic> json) {
    return OsmAddress(
      road: json.containsKey("road") ? json['road'] : "",
      suburb: json.containsKey("suburb") ? json['suburb'] : "",
      cityDistrict: json.containsKey("city_district") ? json['city_district'] : "",
      city: json.containsKey("city") ? json['city'] : "",
      state: json.containsKey("state") ? json['state'] : "",
      region: json.containsKey("region") ? json['region'] : "",
      postcode: json.containsKey("postcode") ? json['postcode'] : "",
      country: json.containsKey("country") ? json['country'] : "",
      countryCode: json.containsKey("country_code") ? json['country_code'] : ""
    );
  }

  static OsmAddress getEmptyAddress() => OsmAddress(
    road: "",
    suburb: "",
    cityDistrict: "",
    city: "",
    state: "",
    region: "",
    postcode: "",
    country: "",
    countryCode: ""
  );

  @override
  String toString() {
    return 'OsmAddress{'
           'road: $road, '
           'suburb: $suburb, '
           'cityDistrict: $cityDistrict, '
           'city: $city, '
           'state: $state, '
           'region: $region, '
           'postcode: $postcode, '
           'country: $country, '
           'countryCode: $countryCode'
           '}';
  }
}
