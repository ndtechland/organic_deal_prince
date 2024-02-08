// To parse this JSON data, do
//
//     final subproductsModel = subproductsModelFromJson(jsonString);

import 'dart:convert';

SubproductsModel subproductsModelFromJson(String str) => SubproductsModel.fromJson(json.decode(str));

String subproductsModelToJson(SubproductsModel data) => json.encode(data.toJson());

class SubproductsModel {
  List<Product>? products;
  dynamic subcategory;
  num? page;
  num? numberOfPages;
  num? categoryId;
  dynamic categoryName;

  SubproductsModel({
    this.products,
    this.subcategory,
    this.page,
    this.numberOfPages,
    this.categoryId,
    this.categoryName,
  });

  factory SubproductsModel.fromJson(Map<String, dynamic> json) => SubproductsModel(
    products: json["Products"] == null ? [] : List<Product>.from(json["Products"]!.map((x) => Product.fromJson(x))),
    subcategory: json["subcategory"],
    page: json["Page"],
    numberOfPages: json["NumberOfPages"],
    categoryId: json["Category_Id"],
    categoryName: json["CategoryName"],
  );

  Map<String, dynamic> toJson() => {
    "Products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "subcategory": subcategory,
    "Page": page,
    "NumberOfPages": numberOfPages,
    "Category_Id": categoryId,
    "CategoryName": categoryName,
  };
}

class Product {
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
  String? isStocks;
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
  String? vendorName;
  List<dynamic>? multipleImage;
  dynamic videoLink;
  dynamic productImageList;
  dynamic multiImageFile;
  dynamic productMultiImages;

  Product({
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
    this.isStocks,
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
    this.vendorName,
    this.multipleImage,
    this.videoLink,
    this.productImageList,
    this.multiImageFile,
    this.productMultiImages,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
    isStocks: json["IsStocks"],
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
    vendorName: json["VendorName"],
    multipleImage: json["multipleImage"] == null ? [] : List<dynamic>.from(json["multipleImage"]!.map((x) => x)),
    videoLink: json["VideoLink"],
    productImageList: json["ProductImageList"],
    multiImageFile: json["MultiImageFile"],
    productMultiImages: json["ProductMultiImages"],
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
    "IsStocks": isStocks,
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
    "VendorName": vendorName,
    "multipleImage": multipleImage == null ? [] : List<dynamic>.from(multipleImage!.map((x) => x)),
    "VideoLink": videoLink,
    "ProductImageList": productImageList,
    "MultiImageFile": multiImageFile,
    "ProductMultiImages": productMultiImages,
  };
}