class MovieModel {
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final bool? adult;
  final String? originalLanguage;
  final List<int> genreIds;
  final double? popularity;
  final DateTime? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieModel({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      adult: json['adult'],
      originalLanguage: json['original_language'],
      genreIds:
          json['genre_ids'] == null ? [] : List<int>.from(json['genere_ids']),
      popularity: json['popularity'],
      releaseDate: DateTime.tryParse(json['release_date'] ?? ''),
      video: json['video'],
      voteAverage: double.tryParse(json['vote_average'].toString()),
      voteCount: json['voteCount'],
    );
  }
}
