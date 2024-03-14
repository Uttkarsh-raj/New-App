class News {
  final String? title;
  final String? body;
  final String? url;
  final String? image;
  final String? source;
  final DateTime? date;
  News({
    this.title,
    this.body,
    this.url,
    this.image,
    this.source,
    this.date,
  });

  News copyWith({
    String? title,
    String? body,
    String? url,
    String? image,
    String? source,
    DateTime? date,
  }) {
    return News(
      title: title ?? this.title,
      body: body ?? this.body,
      url: url ?? this.url,
      image: image ?? this.image,
      source: source ?? this.source,
      date: date ?? this.date,
    );
  }

  static News fromJson(dynamic map) {
    return News(
      title: map['Title'] != null ? map['Title'] as String : null,
      body: map['Description'] != null ? map['Description'] as String : null,
      url: map['Url'] != null ? map['Url'] as String : null,
      image: map['Image'] != null ? map['Image'] as String : null,
      source: map['Source'] != null ? map['Source'] as String : null,
    );
  }

  static Map<String, dynamic> toJson(News news) {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data["Title"] = news.title;
    data["Description"] = news.body;
    data["Source"] = news.source;
    data["PublishedOn"] = news.date;
    data["Url"] = news.url;
    data["Image"] = news.image;
    return data;
  }

  static List<News> newsFromSnapshot(List json) {
    return json.map((news) {
      return News.fromJson(news);
    }).toList();
  }

  @override
  String toString() {
    return 'News(title: $title, body: $body, url: $url, image: $image, source: $source, date: $date)';
  }

  @override
  bool operator ==(covariant News other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.body == body &&
        other.url == url &&
        other.image == image &&
        other.source == source &&
        other.date == date;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        body.hashCode ^
        url.hashCode ^
        image.hashCode ^
        source.hashCode ^
        date.hashCode;
  }
}
