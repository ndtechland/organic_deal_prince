// To parse this JSON data, do
//
//     final invoiceModel = invoiceModelFromJson(jsonString);

import 'dart:convert';

InvoiceModel invoiceModelFromJson(String str) => InvoiceModel.fromJson(json.decode(str));

String invoiceModelToJson(InvoiceModel data) => json.encode(data.toJson());

class InvoiceModel {
  int? id;
  String? invoicePath;

  InvoiceModel({
    this.id,
    this.invoicePath,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
    id: json["Id"],
    invoicePath: json["InvoicePath"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "InvoicePath": invoicePath,
  };
}
