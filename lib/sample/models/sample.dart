class Sample {
  int id;
  String name;

  Sample({required this.id, required this.name});

  factory Sample.fromJson(Map<String, dynamic> json) => Sample (
    id: json['id'],
    name: json['name']
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}