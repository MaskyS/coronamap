class Symptom {
  String label;
  String ref;
  String description;

  Symptom({
    this.label,
    this.ref,
    this.description,
  });

  factory Symptom.fromJson(Map<String, dynamic> json) => Symptom(
    label: json["label"],
    ref: json["ref"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "ref": ref,
    "description": description,
  };
}