import 'dart:convert';

class MovieRecommendationsModel {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  MovieRecommendationsModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieRecommendationsModel.fromRawJson(String str) =>
      MovieRecommendationsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieRecommendationsModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationsModel(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      adult: json["adult"] as bool? ?? false,
      backdropPath: json["backdrop_path"] as String? ?? "",
      genreIds: (json["genre_ids"] as List<dynamic>?)
              ?.map((x) => x as int)
              .toList() ??
          [],
      id: json["id"] as int? ?? 0,
      originalLanguage: json["original_language"] as String? ?? "",
      originalTitle: json["original_title"] as String? ?? "",
      overview: json["overview"] as String? ?? "",
      popularity: json["popularity"]?.toDouble() ?? 0.0,
      posterPath: json["poster_path"] as String? ?? "",
      releaseDate: DateTime.tryParse(json["release_date"] as String? ?? "") ??
          DateTime(2000),
      title: json["title"] as String? ?? "",
      video: json["video"] as bool? ?? false,
      voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
      voteCount: json["vote_count"] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
