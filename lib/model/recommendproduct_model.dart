// To parse this JSON data, do
//
//     final recommendProduct = recommendProductFromJson(jsonString);

import 'dart:convert';

RecommendProductModel recommendProductFromJson(String str) => RecommendProductModel.fromJson(json.decode(str));

String recommendProductToJson(RecommendProductModel data) => json.encode(data.toJson());

class RecommendProductModel {
  RecommendProductModel({
    this.products,
    this.recommendProductNewProducts,
    this.recommendProducts,
    this.hotProducts,
    this.featureProducts,
    this.featureProducts1,
    this.specialProducts,
    this.newProducts,
    this.banners,
    this.proBanners,
  });

  dynamic products;
  dynamic recommendProductNewProducts;
  List<RecommendProductElement>? recommendProducts;
  dynamic hotProducts;
  dynamic featureProducts;
  dynamic featureProducts1;
  dynamic specialProducts;
  dynamic newProducts;
  dynamic banners;
  dynamic proBanners;

  factory RecommendProductModel.fromJson(Map<String, dynamic> json) => RecommendProductModel(
    products: json["Products"],
    recommendProductNewProducts: json["newProducts"],
    recommendProducts: json["RecommendProducts"] == null ? [] : List<RecommendProductElement>.from(json["RecommendProducts"]!.map((x) => RecommendProductElement.fromJson(x))),
    hotProducts: json["HotProducts"],
    featureProducts: json["FeatureProducts"],
    featureProducts1: json["FeatureProducts1"],
    specialProducts: json["specialProducts"],
    newProducts: json["NewProducts"],
    banners: json["Banners"],
    proBanners: json["ProBanners"],
  );

  Map<String, dynamic> toJson() => {
    "Products": products,
    "newProducts": recommendProductNewProducts,
    "RecommendProducts": recommendProducts == null ? [] : List<dynamic>.from(recommendProducts!.map((x) => x.toJson())),
    "HotProducts": hotProducts,
    "FeatureProducts": featureProducts,
    "FeatureProducts1": featureProducts1,
    "specialProducts": specialProducts,
    "NewProducts": newProducts,
    "Banners": banners,
    "ProBanners": proBanners,
  };
}

class RecommendProductElement {
  RecommendProductElement({
    this.subId,
    this.id,
    this.productName,
    this.categoryId,
    this.productImage,
    this.imageBase64,
    this.imageFile,
    this.categoryList,
    this.metricId,
    this.metrics,
    this.metricList,
    this.storeList,
    this.categoryName,
    this.subCategory,
    this.price,
    this.productDescription,
    this.isStock,
    //this.isStocks,
    this.offerValue,
    this.offerType,
    this.offerTypeList,
    this.pAvail,
    this.pageUrl,
    this.isReplacement,
    this.replacementTc,
    this.quantity,
    this.isFeatured,
    this.isFreeShipping,
    this.shippingCharge,
    this.isReviewsAllow,
    this.sku,
    this.brandId,
    this.isActive,
    this.discountCodeId,
    this.discountPrice,
    this.ourPrice,
    this.barcode,
    this.hsnCode,
    this.isVariant,
    this.isRecomend,
    this.isHotdeals,
    this.isFeatureProduct,
    this.isSpecial,
   // this.variants,
    this.vendorId,
    this.premiumAmount,
    this.cgst,
    this.sgst,
    this.igst,
   // this.vendorName,
    this.multipleImage,
    this.productImageList,
    this.multiImageFile,
  });

  dynamic subId;
  num? id;
  String? productName;
  dynamic categoryId;
  String? productImage;
  dynamic imageBase64;
  dynamic imageFile;
  dynamic categoryList;
  num? metricId;
  String? metrics;
  dynamic metricList;
  dynamic storeList;
  String? categoryName;
  dynamic subCategory;
  num? price;
  String? productDescription;
  bool? isStock;
 // IsStocks? isStocks;
  dynamic offerValue;
  dynamic offerType;
  dynamic offerTypeList;
  dynamic pAvail;
  dynamic pageUrl;
  bool? isReplacement;
  dynamic replacementTc;
  num? quantity;
  bool? isFeatured;
  bool? isFreeShipping;
  num? shippingCharge;
  bool? isReviewsAllow;
  dynamic sku;
  dynamic brandId;
  bool? isActive;
  dynamic discountCodeId;
  dynamic discountPrice;
  dynamic ourPrice;
  dynamic barcode;
  dynamic hsnCode;
  bool? isVariant;
  bool? isRecomend;
  bool? isHotdeals;
  bool? isFeatureProduct;
  bool? isSpecial;
 // List<Variant>? variants;
  num? vendorId;
  dynamic premiumAmount;
  dynamic cgst;
  dynamic sgst;
  dynamic igst;
 // VendorName? vendorName;
  dynamic multipleImage;
  dynamic productImageList;
  dynamic multiImageFile;

  factory RecommendProductElement.fromJson(Map<String, dynamic> json) => RecommendProductElement(
    subId: json["subId"],
    id: json["Id"],
    productName: json["ProductName"],
    categoryId: json["Category_Id"],
    productImage: json["ProductImage"],
    imageBase64: json["ImageBase64"],
    imageFile: json["ImageFile"],
    categoryList: json["CategoryList"],
    metricId: json["Metric_Id"],
    metrics: json["Metrics"],
    metricList: json["MetricList"],
    storeList: json["StoreList"],
    categoryName: json["CategoryName"],
    subCategory: json["SubCategory"],
    price: json["Price"],
    productDescription: json["ProductDescription"],
    isStock: json["IsStock"],
   // isStocks: isStocksValues.map[json["IsStocks"]]!,
    offerValue: json["OfferValue"],
    offerType: json["OfferType"],
    offerTypeList: json["OfferTypeList"],
    pAvail: json["PAvail"],
    pageUrl: json["Page_Url"],
    isReplacement: json["IsReplacement"],
    replacementTc: json["ReplacementTC"],
    quantity: json["Quantity"],
    isFeatured: json["IsFeatured"],
    isFreeShipping: json["IsFreeShipping"],
    shippingCharge: json["ShippingCharge"],
    isReviewsAllow: json["IsReviewsAllow"],
    sku: json["SKU"],
    brandId: json["Brand_Id"],
    isActive: json["IsActive"],
    discountCodeId: json["DiscountCode_Id"],
    discountPrice: json["DiscountPrice"],
    ourPrice: json["OurPrice"],
    barcode: json["Barcode"],
    hsnCode: json["HsnCode"],
    isVariant: json["IsVariant"],
    isRecomend: json["IsRecomend"],
    isHotdeals: json["IsHotdeals"],
    isFeatureProduct: json["IsFeatureProduct"],
    isSpecial: json["IsSpecial"],
   // variants: json["Variants"] == null ? [] : List<Variant>.from(json["Variants"]!.map((x) => Variant.fromJson(x))),
    vendorId: json["VendorId"],
    premiumAmount: json["PremiumAmount"],
    cgst: json["CGST"],
    sgst: json["SGST"],
    igst: json["IGST"],
  //  vendorName: json["VendorName"],
    multipleImage: json["multipleImage"],
    productImageList: json["ProductImageList"],
    multiImageFile: json["MultiImageFile"],
  );

  Map<String, dynamic> toJson() => {
    "subId": subId,
    "Id": id,
    "ProductName": productName,
    "Category_Id": categoryId,
    "ProductImage": productImage,
    "ImageBase64": imageBase64,
    "ImageFile": imageFile,
    "CategoryList": categoryList,
    "Metric_Id": metricId,
    "Metrics": metrics,
    "MetricList": metricList,
    "StoreList": storeList,
    "CategoryName": categoryName,
    "SubCategory": subCategory,
    "Price": price,
    "ProductDescription": productDescription,
    "IsStock": isStock,
   // "IsStocks": isStocks,
    "OfferValue": offerValue,
    "OfferType": offerType,
    "OfferTypeList": offerTypeList,
    "PAvail": pAvail,
    "Page_Url": pageUrl,
    "IsReplacement": isReplacement,
    "ReplacementTC": replacementTc,
    "Quantity": quantity,
    "IsFeatured": isFeatured,
    "IsFreeShipping": isFreeShipping,
    "ShippingCharge": shippingCharge,
    "IsReviewsAllow": isReviewsAllow,
    "SKU": sku,
    "Brand_Id": brandId,
    "IsActive": isActive,
    "DiscountCode_Id": discountCodeId,
    "DiscountPrice": discountPrice,
    "OurPrice": ourPrice,
    "Barcode": barcode,
    "HsnCode": hsnCode,
    "IsVariant": isVariant,
    "IsRecomend": isRecomend,
    "IsHotdeals": isHotdeals,
    "IsFeatureProduct": isFeatureProduct,
    "IsSpecial": isSpecial,
   // "Variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x.toJson())),
    "VendorId": vendorId,
    "PremiumAmount": premiumAmount,
    "CGST": cgst,
    "SGST": sgst,
    "IGST": igst,
   // "VendorName": vendorName,
    "multipleImage": multipleImage,
    "ProductImageList": productImageList,
    "MultiImageFile": multiImageFile,
  };
}
