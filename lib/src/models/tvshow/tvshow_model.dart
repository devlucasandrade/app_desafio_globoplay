import 'dart:convert';

import 'tvshow_details_model.dart';

TvShowModel tvShowModelFromJson(String str) =>
    TvShowModel.fromJson(json.decode(str));

String tvShowModelToJson(TvShowModel data) => json.encode(data.toJson());

class TvShowModel {
  TvShowModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<TvShowDetailsModel>? results;
  int? totalPages;
  int? totalResults;

  factory TvShowModel.fromJson(Map<String, dynamic> json) => TvShowModel(
        page: json["page"],
        results: List<TvShowDetailsModel>.from(
            json["results"].map((x) => TvShowDetailsModel.fromJson(x))),
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
