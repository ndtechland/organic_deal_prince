// To parse this JSON data, do
//
//     final subTotalModel = subTotalModelFromJson(jsonString);

import 'dart:convert';

SubTotalModel subTotalModelFromJson(String str) => SubTotalModel.fromJson(json.decode(str));

String subTotalModelToJson(SubTotalModel data) => json.encode(data.toJson());

class SubTotalModel {
  Newmodeld? newmodeld;

  SubTotalModel({
    this.newmodeld,
  });

  factory SubTotalModel.fromJson(Map<String, dynamic> json) => SubTotalModel(
    newmodeld: json["newmodeld"] == null ? null : Newmodeld.fromJson(json["newmodeld"]),
  );

  Map<String, dynamic> toJson() => {
    "newmodeld": newmodeld?.toJson(),
  };
}

class Newmodeld {
  double? totalprice;
  double? gst;
  double? shipping;
  double? grandTotals;

  Newmodeld({
    this.totalprice,
    this.gst,
    this.shipping,
    this.grandTotals,
  });

  factory Newmodeld.fromJson(Map<String, dynamic> json) => Newmodeld(
    totalprice: json["totalprice"],
    gst: json["Gst"]?.toDouble(),
    shipping: json["shipping"],
    grandTotals: json["GrandTotals"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "totalprice": totalprice,
    "Gst": gst,
    "shipping": shipping,
    "GrandTotals": grandTotals,
  };
}
