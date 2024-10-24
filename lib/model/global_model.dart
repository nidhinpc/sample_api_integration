// To parse this JSON data, do
//
//     final globalModel = globalModelFromJson(jsonString);

import 'dart:convert';

GlobalModel globalModelFromJson(String str) =>
    GlobalModel.fromJson(json.decode(str));

String globalModelToJson(GlobalModel data) => json.encode(data.toJson());

class GlobalModel {
  Time? time;
  String? disclaimer;
  String? chartName;
  Bpi? bpi;

  GlobalModel({
    this.time,
    this.disclaimer,
    this.chartName,
    this.bpi,
  });

  factory GlobalModel.fromJson(Map<String, dynamic> json) => GlobalModel(
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        disclaimer: json["disclaimer"],
        chartName: json["chartName"],
        bpi: json["bpi"] == null ? null : Bpi.fromJson(json["bpi"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time?.toJson(),
        "disclaimer": disclaimer,
        "chartName": chartName,
        "bpi": bpi?.toJson(),
      };
}

class Bpi {
  Eur? usd;
  Eur? gbp;
  Eur? eur;

  Bpi({
    this.usd,
    this.gbp,
    this.eur,
  });

  factory Bpi.fromJson(Map<String, dynamic> json) => Bpi(
        usd: json["USD"] == null ? null : Eur.fromJson(json["USD"]),
        gbp: json["GBP"] == null ? null : Eur.fromJson(json["GBP"]),
        eur: json["EUR"] == null ? null : Eur.fromJson(json["EUR"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd?.toJson(),
        "GBP": gbp?.toJson(),
        "EUR": eur?.toJson(),
      };
}

class Eur {
  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rateFloat;

  Eur({
    this.code,
    this.symbol,
    this.rate,
    this.description,
    this.rateFloat,
  });

  factory Eur.fromJson(Map<String, dynamic> json) => Eur(
        code: json["code"],
        symbol: json["symbol"],
        rate: json["rate"],
        description: json["description"],
        rateFloat: json["rate_float"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "symbol": symbol,
        "rate": rate,
        "description": description,
        "rate_float": rateFloat,
      };
}

class Time {
  String? updated;
  DateTime? updatedIso;
  String? updateduk;

  Time({
    this.updated,
    this.updatedIso,
    this.updateduk,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        updated: json["updated"],
        updatedIso: json["updatedISO"] == null
            ? null
            : DateTime.parse(json["updatedISO"]),
        updateduk: json["updateduk"],
      );

  Map<String, dynamic> toJson() => {
        "updated": updated,
        "updatedISO": updatedIso?.toIso8601String(),
        "updateduk": updateduk,
      };
}
