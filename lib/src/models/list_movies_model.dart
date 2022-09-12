import 'results_model.dart';

class ListMoviesModel {
  double? averageRating;
  String? backdropPath;
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

  ListMoviesModel({
    this.averageRating,
    this.backdropPath,
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

  factory ListMoviesModel.fromJson(Map<String, dynamic> json) =>
      ListMoviesModel(
        averageRating: json["average_rating"].toDouble(),
        backdropPath: json["backdrop_path"],
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
