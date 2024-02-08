// To parse this JSON data, do
//
//     final subCategory = subCategoryFromJson(jsonString);

import 'dart:convert';

SubCategory subCategoryFromJson(String str) => SubCategory.fromJson(json.decode(str));

String subCategoryToJson(SubCategory data) => json.encode(data.toJson());

class SubCategory {
  SubCategory({
    required this.products,
    this.subcategory,
    required this.page,
    required this.numberOfPages,
    required this.categoryId,
    this.categoryName,
  });

  List<Product> products;
  dynamic subcategory;
  int page;
  int numberOfPages;
  int categoryId;
  dynamic categoryName;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    products: List<Product>.from(json["Products"].map((x) => Product.fromJson(x))),
    subcategory: json["subcategory"],
    page: json["Page"],
    numberOfPages: json["NumberOfPages"],
    categoryId: json["Category_Id"],
    categoryName: json["CategoryName"],
  );

  Map<String, dynamic> toJson() => {
    "Products": List<dynamic>.from(products.map((x) => x.toJson())),
    "subcategory": subcategory,
    "Page": page,
    "NumberOfPages": numberOfPages,
    "Category_Id": categoryId,
    "CategoryName": categoryName,
  };
}

class Product {
  Product({
    this.subId,
    required this.id,
    required this.productName,
    this.categoryId,
    required this.productImage,
    this.imageBase64,
    this.imageFile,
    this.categoryList,
    required this.metricId,
    required this.metrics,
    this.metricList,
    this.storeList,
    required this.categoryName,
    this.subCategory,
    required this.price,
    required this.productDescription,
    required this.isStock,
    required this.isStocks,
    this.offerValue,
    this.offerType,
    this.offerTypeList,
    this.pAvail,
    this.pageUrl,
    required this.isReplacement,
    this.replacementTc,
    required this.quantity,
    required this.isFeatured,
    required this.isFreeShipping,
    required this.shippingCharge,
    required this.isReviewsAllow,
    this.sku,
    this.brandId,
    required this.isActive,
    this.discountCodeId,
    this.discountPrice,
    this.ourPrice,
    this.barcode,
    this.hsnCode,
    required this.isVariant,
    required this.isRecomend,
    required this.isHotdeals,
    required this.isFeatureProduct,
    required this.isSpecial,
    this.variants,
    this.vendorId,
    this.premiumAmount,
    this.cgst,
    this.sgst,
    this.igst,
    this.multipleImage,
    this.productImageList,
    this.multiImageFile,
  });

  dynamic subId;
  int id;
  String productName;
  dynamic categoryId;
  String productImage;
  dynamic imageBase64;
  dynamic imageFile;
  dynamic categoryList;
  int metricId;
  String metrics;
  dynamic metricList;
  dynamic storeList;
  String categoryName;
  dynamic subCategory;
  int price;
  String productDescription;
  bool isStock;
  String isStocks;
  dynamic offerValue;
  dynamic offerType;
  dynamic offerTypeList;
  dynamic pAvail;
  dynamic pageUrl;
  bool isReplacement;
  dynamic replacementTc;
  int quantity;
  bool isFeatured;
  bool isFreeShipping;
  int shippingCharge;
  bool isReviewsAllow;
  dynamic sku;
  dynamic brandId;
  bool isActive;
  dynamic discountCodeId;
  dynamic discountPrice;
  dynamic ourPrice;
  dynamic barcode;
  dynamic hsnCode;
  bool isVariant;
  bool isRecomend;
  bool isHotdeals;
  bool isFeatureProduct;
  bool isSpecial;
  dynamic variants;
  dynamic vendorId;
  dynamic premiumAmount;
  dynamic cgst;
  dynamic sgst;
  dynamic igst;
  dynamic multipleImage;
  dynamic productImageList;
  dynamic multiImageFile;

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
    variants: json["Variants"],
    vendorId: json["VendorId"],
    premiumAmount: json["PremiumAmount"],
    cgst: json["CGST"],
    sgst: json["SGST"],
    igst: json["IGST"],
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
    "Variants": variants,
    "VendorId": vendorId,
    "PremiumAmount": premiumAmount,
    "CGST": cgst,
    "SGST": sgst,
    "IGST": igst,
    "multipleImage": multipleImage,
    "ProductImageList": productImageList,
    "MultiImageFile": multiImageFile,
  };
}
