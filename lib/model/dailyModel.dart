class Daily {
  String id;
  String value;

  Daily({this.id, this.value});

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      id: json['datetime'],
      value: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] = this.id;
    data['data'] = this.value;
    return data;
  }
}
