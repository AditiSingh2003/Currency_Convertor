import 'dart:convert';

RatesModel ratesModelFromJson(String str) => RatesModel.fromJson(json.decode(str));

String ratesModelToJson(RatesModel data) => json.encode(data.toJson()); //take the data out from the created model


class RatesModel {
  RatesModel({
    required this.disclaimer,
    required this.licence,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  String? disclaimer;
  String? licence;
  int? timestamp;
  String? base;
  Map<String,double> rates;

  factory RatesModel.fromJson(Map<String, dynamic> json) => RatesModel(
      disclaimer: json["disclaimer"],
      licence: json["licence"],
      timestamp: json["timestamp"],
      base: json["base"],
      rates: Map.from(json["rates"]).map((k,v) => MapEntry<String, double>(k, v.toDouble())),
  );

  Map<String, dynamic> toJson() =>{
    "disclaimer" : disclaimer,
    "license" : licence,
    "timestamp" : timestamp,
    "base" : base,
    "rates" : Map.from(rates).map((k,v) => MapEntry<String, dynamic>(k,v)),
  };

}