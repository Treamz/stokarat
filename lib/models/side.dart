class Side {
  String name;
  String url;

  Side({required this.name, required this.url});

  factory Side.fromJson(Map<String, dynamic> json) {
    return Side(name: json["name"], url: json["url"]);
  }
}
