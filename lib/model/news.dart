class News {
  final String status;
  final int totalResults;
  List<Articles> articles;
  News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      status: json['status'] ?? '',
      totalResults: json['totalResults'] ?? 0,
      articles: (json['articles'] as List? ?? [])
          .map((item) => Articles.fromJson(item))
          .toList(),
    );
  }
}

class Articles {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  Articles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      source: json['source'] != null
          ? Source.fromJson(json['source'])
          : Source(id: "", name: ""),
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
    );
  }
}

class Source {
  final String id;
  final String name;
  Source({required this.id, required this.name});
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id']?.toString() ?? "", name: json['name'] ?? "");
  }
}
