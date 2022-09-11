import 'dart:convert';

MoviesModel moviesModelFromJson(String str) =>
    MoviesModel.fromJson(json.decode(str));

String moviesModelToJson(MoviesModel data) => json.encode(data.toJson());

class MoviesModel {
  MoviesModel({
    this.averageRating,
    this.backdropPath,
    this.createdBy,
    this.description,
    this.id,
    this.name,
    this.page,
    this.posterPath,
    this.public,
    this.results,
    this.revenue,
    this.runtime,
    this.sortBy,
    this.totalPages,
    this.totalResults,
  });

  double? averageRating;
  String? backdropPath;
  CreatedBy? createdBy;
  String? description;
  int? id;
  String? name;
  int? page;
  String? posterPath;
  bool? public;
  List<Result>? results;
  int? revenue;
  int? runtime;
  String? sortBy;
  int? totalPages;
  int? totalResults;

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        averageRating: json["average_rating"].toDouble(),
        backdropPath: json["backdrop_path"],
        createdBy: CreatedBy.fromJson(json["created_by"]),
        description: json["description"],
        id: json["id"],
        name: json["name"],
        page: json["page"],
        posterPath: json["poster_path"],
        public: json["public"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        revenue: json["revenue"],
        runtime: json["runtime"],
        sortBy: json["sort_by"],
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "average_rating": averageRating,
        "backdrop_path": backdropPath,
        "created_by": createdBy!.toJson(),
        "description": description,
        "id": id,
        "name": name,
        "page": page,
        "poster_path": posterPath,
        "public": public,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "revenue": revenue,
        "runtime": runtime,
        "sort_by": sortBy,
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class CreatedBy {
  CreatedBy({
    this.gravatarHash,
    this.id,
    this.name,
    this.username,
  });

  String? gravatarHash;
  String? id;
  String? name;
  String? username;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        gravatarHash: json["gravatar_hash"],
        id: json["id"],
        name: json["name"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "gravatar_hash": gravatarHash,
        "id": id,
        "name": name,
        "username": username,
      };
}

class Result {
  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
