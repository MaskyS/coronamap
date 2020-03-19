class Address {
  String region;
  String country;
  String firstLine;
  String secondLine;
  String postalCode;
  String district;

  Address({
    this.region,
    this.country,
    this.firstLine,
    this.secondLine,
    this.postalCode,
    this.district,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    region: json["region"],
    country: json["country"],
    firstLine: json["firstLine"],
    secondLine: json["secondLine"],
    postalCode: json["postalCode"],
    district: json["district"],
  );

  Map<String, dynamic> toJson() => {
    "region": region,
    "country": country,
    "firstLine": firstLine,
    "secondLine": secondLine,
    "postalCode": postalCode,
    "district": district,
  };
}