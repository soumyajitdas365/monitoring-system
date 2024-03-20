class Field {
  DateTime createdAt;
  int entryId;
  int value;
  String? name;

  Field(
      {required this.createdAt,
      required this.entryId,
      required this.value,
      this.name});

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
        name: json['name'],
        entryId: json['entry_id'],
        value: int.tryParse(json['field1'].toString()) ?? 0,
        createdAt: DateTime.tryParse(json['created_at']) ?? DateTime.now());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['entry_id'] = this.entryId;
    data['field1'] = this.value;
    data['name'] = this.name;
    return data;
  }
}
