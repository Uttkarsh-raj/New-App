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
      title: map['title'] != null ? map['title'] as String : null,
      body: map['description'] != null ? map['description'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      image: map['urlToImage'] != null ? map['urlToImage'] as String : null,
      // source: map['Source'] != null ? map['Source'] as String : null,
      source: map['content'] != null ? map['content'] as String : null,
    );
  }

  static Map<String, dynamic> toJson(News news) {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = news.title;
    data["description"] = news.body;
    data["content"] = news.source;
    data["publishedAt"] = news.date;
    data["url"] = news.url;
    data["urlToImage"] = news.image;
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
