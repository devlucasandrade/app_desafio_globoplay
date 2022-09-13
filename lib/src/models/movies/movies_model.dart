import 'dart:convert';

import 'movies_results_model.dart';

MoviesModel popularModelFromJson(String str) =>
    MoviesModel.fromJson(json.decode(str));

String popularModelToJson(MoviesModel data) => json.encode(data.toJson());

class MoviesModel {
  MoviesModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<MoviesResult>? results;
  int? totalPages;
  int? totalResults;

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        page: json["page"],
        results: List<MoviesResult>.from(
            json["results"].map((x) => MoviesResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
