class Address {
  String city;
  String country;
  String firstLine;
  String secondLine;
  String postalCode;

  Address({
    this.city,
    this.country,
    this.firstLine,
    this.secondLine,
    this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    country: json["country"],
    firstLine: json["firstLine"],
    secondLine: json["secondLine"],
    postalCode: json["postalCode"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "country": country,
    "firstLine": firstLine,
    "secondLine": secondLine,
    "postalCode": postalCode,
  };
}