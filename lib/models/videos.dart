class Videos {
  String title;
  String embed;

  Videos({required this.title, required this.embed});

  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(title: json["title"], embed: json["embed"]);
  }
}
