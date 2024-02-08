
import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.hotDeals,
    this.specialDeals,
    this.newArrivalDeals,
    this.reccomendedDeals,
    this.organicDeals,
  });

  List<HotDeal>? hotDeals;
  dynamic specialDeals;
  dynamic newArrivalDeals;
  dynamic reccomendedDeals;
  dynamic organicDeals;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    hotDeals: List<HotDeal>.from(json["HotDeals"].map((x) => HotDeal.fromJson(x))),
    specialDeals: json["SpecialDeals"],
    newArrivalDeals: json["NewArrivalDeals"],
    reccomendedDeals: json["ReccomendedDeals"],
    organicDeals: json["OrganicDeals"],
  );

  Map<String, dynamic> toJson() => {
    "HotDeals": List<dynamic>.from(hotDeals!.map((x) => x.toJson())),
    "SpecialDeals": specialDeals,
    "NewArrivalDeals": newArrivalDeals,
    "ReccomendedDeals": reccomendedDeals,
    "OrganicDeals": organicDeals,
  };
}

class HotDeal {
  HotDeal({
    // this.subId,
    this.id,
    this.productName,
    //this.categoryId,
    this.productImage,
    // this.imageBase64,
    // this.imageFile,
    // this.categoryList,
    // this.metricId,
     this.metrics,
    // this.metricList,
    // this.storeList,
    // this.categoryName,
    // this.subCategory,
    this.price,
    // this.productDescription,
    // this.isStock,
    // this.isStocks,
    // this.offerValue,
    // this.offerType,
    // this.offerTypeList,
    // this.pAvail,
    // this.pageUrl,
    // this.isReplacement,
    // this.replacementTc,
     this.quantity,
    // this.isFeatured,
    // this.isFreeShipping,
    // this.shippingCharge,
    // this.isReviewsAllow,
    // this.sku,
    // this.brandId,
    // this.isActive,
    // this.discountCodeId,
     this.discountPrice,
     this.ourPrice,
    // this.barcode,
    // this.hsnCode,
    // this.isVariant,
    // this.isRecomend,
    // this.isHotdeals,
    // this.isFeatureProduct,
    // this.isSpecial,
    // this.variants,
    // this.vendorId,
    // this.premiumAmount,
    // this.cgst,
    // this.sgst,
    // this.igst,
    // this.vendorName,
    // this.multipleImage,
    // this.productImageList,
    // this.multiImageFile,
  });

  // dynamic subId;
  int? id;
  String? productName;
  // dynamic categoryId;
  String? productImage;
  // dynamic imageBase64;
  // dynamic imageFile;
  // dynamic categoryList;
  // int metricId;
   String? metrics;
  // dynamic metricList;
  // dynamic storeList;
  // String categoryName;
  // dynamic subCategory;
  num? price;
  // String productDescription;
  // bool isStock;
  // String isStocks;
  // dynamic offerValue;
  // dynamic offerType;
  // dynamic offerTypeList;
  // dynamic pAvail;
  // dynamic pageUrl;
  // bool isReplacement;
  // dynamic replacementTc;
   num? quantity;
  // bool isFeatured;
  // bool isFreeShipping;
  // int shippingCharge;
  // bool isReviewsAllow;
  // dynamic sku;
  // dynamic brandId;
  // bool isActive;
  // dynamic discountCodeId;
   dynamic discountPrice;
   dynamic ourPrice;
  // dynamic barcode;
  // dynamic hsnCode;
  // bool isVariant;
  // bool isRecomend;
  // bool isHotdeals;
  // bool isFeatureProduct;
  // bool isSpecial;
  // dynamic variants;
  // int vendorId;
  // dynamic premiumAmount;
  // dynamic cgst;
  // dynamic sgst;
  // dynamic igst;
  // dynamic vendorName;
  // dynamic multipleImage;
  // dynamic productImageList;
  // dynamic multiImageFile;

  factory HotDeal.fromJson(Map<String, dynamic> json) => HotDeal(
    // subId: json["subId"],
    id: json["Id"],
    productName: json["ProductName"],
    //  categoryId: json["Category_Id"],
    productImage: json["ProductImage"],
    // imageBase64: json["ImageBase64"],
    // imageFile: json["ImageFile"],
    // categoryList: json["CategoryList"],
    // metricId: json["Metric_Id"],
     metrics: json["Metrics"],
    // metricList: json["MetricList"],
    // storeList: json["StoreList"],
    // categoryName: json["CategoryName"],
    // subCategory: json["SubCategory"],
    price: json["Price"],
    // productDescription: json["ProductDescription"],
    // isStock: json["IsStock"],
    // isStocks: json["IsStocks"],
    // offerValue: json["OfferValue"],
    // offerType: json["OfferType"],
    // offerTypeList: json["OfferTypeList"],
    // pAvail: json["PAvail"],
    // pageUrl: json["Page_Url"],
    // isReplacement: json["IsReplacement"],
    // replacementTc: json["ReplacementTC"],
     quantity: json["Quantity"],
    // isFeatured: json["IsFeatured"],
    // isFreeShipping: json["IsFreeShipping"],
    // shippingCharge: json["ShippingCharge"],
    // isReviewsAllow: json["IsReviewsAllow"],
    // sku: json["SKU"],
    // brandId: json["Brand_Id"],
    // isActive: json["IsActive"],
    // discountCodeId: json["DiscountCode_Id"],
     discountPrice: json["DiscountPrice"],
     ourPrice: json["OurPrice"],
    // barcode: json["Barcode"],
    // hsnCode: json["HsnCode"],
    // isVariant: json["IsVariant"],
    // isRecomend: json["IsRecomend"],
    // isHotdeals: json["IsHotdeals"],
    // isFeatureProduct: json["IsFeatureProduct"],
    // isSpecial: json["IsSpecial"],
    // variants: json["Variants"],
    // vendorId: json["VendorId"],
    // premiumAmount: json["PremiumAmount"],
    // cgst: json["CGST"],
    // sgst: json["SGST"],
    // igst: json["IGST"],
    // vendorName: json["VendorName"],
    // multipleImage: json["multipleImage"],
    // productImageList: json["ProductImageList"],
    // multiImageFile: json["MultiImageFile"],
  );

  Map<String, dynamic> toJson() => {
    // "subId": subId,
    "Id": id,
    "ProductName": productName,
    //"Category_Id": categoryId,
    "ProductImage": productImage,
    // "ImageBase64": imageBase64,
    // "ImageFile": imageFile,
    // "CategoryList": categoryList,
    // "Metric_Id": metricId,
     "Metrics": metrics,
    // "MetricList": metricList,
    // "StoreList": storeList,
    // "CategoryName": categoryName,
    // "SubCategory": subCategory,
    "Price": price,
    // "ProductDescription": productDescription,
    // "IsStock": isStock,
    // "IsStocks": isStocks,
    // "OfferValue": offerValue,
    // "OfferType": offerType,
    // "OfferTypeList": offerTypeList,
    // "PAvail": pAvail,
    // "Page_Url": pageUrl,
    // "IsReplacement": isReplacement,
    // "ReplacementTC": replacementTc,
     "Quantity": quantity,
    // "IsFeatured": isFeatured,
    // "IsFreeShipping": isFreeShipping,
    // "ShippingCharge": shippingCharge,
    // "IsReviewsAllow": isReviewsAllow,
    // "SKU": sku,
    // "Brand_Id": brandId,
    // "IsActive": isActive,
    // "DiscountCode_Id": discountCodeId,
     "DiscountPrice": discountPrice,
     "OurPrice": ourPrice,
    // "Barcode": barcode,
    // "HsnCode": hsnCode,
    // "IsVariant": isVariant,
    // "IsRecomend": isRecomend,
    // "IsHotdeals": isHotdeals,
    // "IsFeatureProduct": isFeatureProduct,
    // "IsSpecial": isSpecial,
    // "Variants": variants,
    // "VendorId": vendorId,
    // "PremiumAmount": premiumAmount,
    // "CGST": cgst,
    // "SGST": sgst,
    // "IGST": igst,
    // "VendorName": vendorName,
    // "multipleImage": multipleImage,
    // "ProductImageList": productImageList,
    // "MultiImageFile": multiImageFile,
  };
}
