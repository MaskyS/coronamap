class Gender {
  String label;
  String ref;

  Gender({
    this.label,
    this.ref,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
    label: json["label"],
    ref: json["ref"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "ref": ref,
  };
}