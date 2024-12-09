import 'dart:convert';

ResponseItem responseItemFromJson(String str) =>
    ResponseItem.fromJson(json.decode(str));

String responseItemToJson(ResponseItem data) => json.encode(data.toJson());

class ResponseItem {
  ResponseItem({
    this.data,
    this.entries,
    this.message = "",
    this.status = false,
    this.statusCode,
  });

  dynamic data;
  dynamic entries;
  String? message;
  bool status;
  int? statusCode;

  factory ResponseItem.fromJson(Map<String, dynamic> json) => ResponseItem(
        data: json["data"],
        message: json["message"],
        status: json["result"],
        entries: json["entries"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "msg": message,
        "status": status,
        "entries": entries,
      };
}
