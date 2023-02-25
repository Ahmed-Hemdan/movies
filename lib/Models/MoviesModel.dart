class Items {
  List<dynamic>? moviesList;
  Items({this.moviesList});
  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(moviesList: json['items']);
  }
}

class Movie {
  final String? id;
  final String? rank;
  final String? title;
  final String? fullTitle;
  final String? year;
  final String? image;
  final String? crew;
  final String? imDbRating;
  final String? imDbRatingCount;
  Movie(
      {this.id,
      this.rank,
      this.title,
      this.fullTitle,
      this.year,
      this.image,
      this.crew,
      this.imDbRating,
      this.imDbRatingCount});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
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
}
