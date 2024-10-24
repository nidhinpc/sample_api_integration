// class FactScreenModel {
//   String? fact;
//   num? length;
//   FactScreenModel(this.fact, this.length);
// }
// To parse this JSON data, do
//
//     final factModel = factModelFromJson(jsonString);

import 'dart:convert';

FactModel factModelFromJson(String str) => FactModel.fromJson(json.decode(str));

String factModelToJson(FactModel data) => json.encode(data.toJson());

class FactModel {
  String? fact;
  int? length;

  FactModel({
    this.fact,
    this.length,
  });

  factory FactModel.fromJson(Map<String, dynamic> json) => FactModel(
        fact: json["fact"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "fact": fact,
        "length": length,
      };
}
