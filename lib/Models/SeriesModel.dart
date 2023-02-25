class ItemsSeries {
  List<dynamic>? seriesList;
  ItemsSeries({this.seriesList});
  factory ItemsSeries.fromJson(Map<String, dynamic> json) {
    return ItemsSeries(seriesList: json['items']);
  }
}

class Series {
  final String? id;
  final String? rank;
  final String? title;
  final String? fullTitle;
  final String? year;
  final String? image;
  final String? crew;
  final String? imDbRating;
  final String? imDbRatingCount;
  Series(
      {this.id,
      this.rank,
      this.title,
      this.fullTitle,
      this.year,
      this.image,
      this.crew,
      this.imDbRating,
      this.imDbRatingCount});

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
        id: json['id'],
        rank: json['rank'],
        title: json['title'],
        fullTitle: json['fullTilte'],
        year: json['year'],
        image: json['image'],
        crew: json['crew'],
        imDbRating: json['imDbRating'],
        imDbRatingCount: json['imDbRatingCount']);
  }

  toList() {}
}
