class User {
  Map? data;
  int? resultCode;
  String? resultMessage;

  User({this.data, this.resultCode, this.resultMessage});

  factory User.fromJson(Map<String, dynamic> json) => User(
      data: json['data'],
      resultCode: json['resultCode'],
      resultMessage: json['resultMessage']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = data;
    data['resultCode'] = resultCode;
    data['resultMessage'] = resultMessage;
    return data;
  }
}
