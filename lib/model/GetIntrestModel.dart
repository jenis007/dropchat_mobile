import 'dart:convert';

GetInterestModel getInterestModelFromJson(String str) =>
    GetInterestModel.fromJson(json.decode(str));

String getInterestModelToJson(GetInterestModel data) =>
    json.encode(data.toJson());

class GetInterestModel {
  List<Entry> entries;
  String next;
  int pageNumber;
  int pageSize;
  dynamic prev;
  int totalEntries;
  int totalPages;

  GetInterestModel({
    required this.entries,
    required this.next,
    required this.pageNumber,
    required this.pageSize,
    required this.prev,
    required this.totalEntries,
    required this.totalPages,
  });

  factory GetInterestModel.fromJson(Map<String, dynamic> json) =>
      GetInterestModel(
        entries: json["entries"] != null
            ? List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x)))
            : [],
        next: json["next"] ?? "",
        pageNumber: json["page_number"] ?? 0,
        pageSize: json["page_size"] ?? 0,
        prev: json["prev"],
        totalEntries: json["total_entries"] ?? 0,
        totalPages: json["total_pages"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "entries": List<dynamic>.from(entries.map((x) => x.toJson())),
        "next": next,
        "page_number": pageNumber,
        "page_size": pageSize,
        "prev": prev,
        "total_entries": totalEntries,
        "total_pages": totalPages,
      };
}

class Entry {
  bool disabled;
  String hashtag;
  String icon;
  int id;
  DateTime? insertedAt;
  int popularity;

  Entry({
    required this.disabled,
    required this.hashtag,
    required this.icon,
    required this.id,
    required this.insertedAt,
    required this.popularity,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        disabled: json["disabled"] ?? false,
        hashtag: json["hashtag"] ?? "",
        icon: json["icon"] ?? "",
        id: json["id"] ?? 0,
        insertedAt: json["inserted_at"] != null
            ? DateTime.parse(json["inserted_at"])
            : null,
        popularity: json["popularity"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "disabled": disabled,
        "hashtag": hashtag,
        "icon": icon,
        "id": id,
        "inserted_at": insertedAt?.toIso8601String(),
        "popularity": popularity,
      };
}
