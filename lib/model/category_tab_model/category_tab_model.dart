// To parse this JSON data, do
//
//     final shopByCategory = shopByCategoryFromJson(jsonString);
//
// import 'dart:convert';
//
// ShopByCategory shopByCategoryFromJson(String str) => ShopByCategory.fromJson(json.decode(str));
//
// String shopByCategoryToJson(ShopByCategory data) => json.encode(data.toJson());
//
// class ShopByCategory {
//   ShopByCategory({
//     required this.category,
//     required this.message,
//     required this.status,
//   });
//
//   List<Category> category;
//   String message;
//   String status;
//
//   factory ShopByCategory.fromJson(Map<String, dynamic> json) => ShopByCategory(
//     category: List<Category>.from(json["Category"].map((x) => Category.fromJson(x))),
//     message: json["Message"],
//     status: json["Status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Category": List<dynamic>.from(category.map((x) => x.toJson())),
//     "Message": message,
//     "Status": status,
//   };
// }
//
// class Category {
//   Category({
//     required this.id,
//     required this.categoryName,
//     required this.categoryImage,
//     this.upToText,
//     required this.subCategories,
//   });
//
//   int id;
//   String categoryName;
//   String categoryImage;
//   dynamic upToText;
//   List<SubCategory> subCategories;
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//     id: json["Id"],
//     categoryName: json["CategoryName"],
//     categoryImage: json["CategoryImage"],
//     upToText: json["UpToText"],
//     subCategories: List<SubCategory>.from(json["SubCategories"].map((x) => SubCategory.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "CategoryName": categoryName,
//     "CategoryImage": categoryImage,
//     "UpToText": upToText,
//     "SubCategories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
//   };
// }
//
// class SubCategory {
//   SubCategory({
//     required this.id,
//     required this.name,
//     required this.mainCatId,
//     required this.subCategroyImage,
//     this.upToText,
//   });
//
//   int id;
//   String name;
//   int mainCatId;
//   String subCategroyImage;
//   String? upToText;
//
//   factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
//     id: json["Id"],
//     name: json["Name"],
//     mainCatId: json["MainCat_Id"],
//     subCategroyImage: json["SubCategroyImage"],
//     upToText: json["UpToText"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "Name": name,
//     "MainCat_Id": mainCatId,
//     "SubCategroyImage": subCategroyImage,
//     "UpToText": upToText,
//   };
// }
