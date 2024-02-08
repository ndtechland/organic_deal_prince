import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/model/address_select_model.dart';
import 'package:organic_deal/model/cancelOrder_model.dart';
import 'package:organic_deal/model/cartListApiModel/cartListApi_model.dart';
import 'package:organic_deal/model/cart_model.dart';
import 'package:organic_deal/model/couponList_model.dart';
import 'package:organic_deal/model/home_banner_model.dart';
import 'package:organic_deal/model/homefilter_model.dart';
import 'package:organic_deal/model/hotdetails_model.dart';
import 'package:organic_deal/model/invoice_model.dart';
import 'package:organic_deal/model/orderDetailPage_model.dart';
import 'package:organic_deal/model/orderHistoryApi_model.dart';
import 'package:organic_deal/model/recommendproduct_model.dart';
import 'package:organic_deal/model/shopbycategory_model.dart';
import 'package:organic_deal/model/special_products_model.dart';
import 'package:organic_deal/model/subProducts_model/subproduct_model.dart';
import 'package:organic_deal/model/subTotal_model.dart';
import 'package:organic_deal/model/userprofile_model.dart';
import 'package:organic_deal/model/wallet/getWalletAmountModel.dart';
import 'package:organic_deal/pages/MyOrder/invoicePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// const MY_CART_KEY = 'Cart';
// bool isExistsInCart(RxList<CartModel> cart, CartModel cartItem){
//   return cart.length == 0 ? false : cart.any((e) => e.id == cartItem.id)
//       ? true : false;
// }
// void saveDatabase(RxList<CartModel> cart){
//   var box = GetStorage();
//   box.write(MY_CART_KEY, jsonEncode(cart));
// }

class ApiProvider{
  static var Id = '';

  static var baseUrl = 'https://admin.organicdeal.in/api/';//'https://organicdeal.in/api/';
  // banner Api
  static SliderBannerApi() async {
    var url = baseUrl + 'ProductAPI/Banners';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final homeBannerModel = homeBannerModelFromJson(r.body);
        print('homeBannerlist: ${homeBannerModel.banner[0].bannerPath}');
        return homeBannerModel;
      }
    } catch (error) {
      print('homeBannerError: ${error}');
      return;
    }
  }
  // category_tab home bottom
static CategoryTabApi()async{
    var url = baseUrl + 'Productapi/GetCategory';
    try{
      http.Response r = await http.get(Uri.parse(url));
      if(r.statusCode == 200){
        ShopByCategory category = shopByCategoryFromJson(r.body);
           return category;
      }
    }catch (error){
      return;
    }
}
//shopByCategory home tab
  static ShopbyCategoryApi()async{
    var url = baseUrl + 'Productapi/GetCategory';
    try{
      http.Response r = await http.get(Uri.parse(url));
      if(r.statusCode == 200){
        ShopByCategory category = shopByCategoryFromJson(r.body);
        print("ShopByCategoryApi: ${r.body}");
        return category;
      }
    }catch (error){
      return;
    }
  }
  //home search
  static HomeSearchApi(String text)async{
    String url = baseUrl + 'ProductAPI/SearchProducts?term=$text';
    try{
      http.Response r = await http.get(Uri.parse(url),);
      if(r.statusCode == 200){
        List<HomeSearchModel> homesearch= homeSearchFromJson(r.body);
        return homesearch;
      }
    }catch (error){
      return;
    }
  }
  //special products
  static SpecialProductsApi()async{
   String url = 'https://admin.organicdeal.in/api/ProductAPI/SpecialProducts';
     try{
      http.Response r = await http.get(Uri.parse(url),);
      if(r.statusCode == 200){
        final specialProductModel = specialProductModelFromJson(r.body);
        print('specialProduct: ${specialProductModel.specialProducts?[0].categoryName}');
        return specialProductModel;
      }
    }catch (error){
       print('specialProductError: ${error}');
      return;
    }
  }
  // hot details api
  static HotDetailsApi()async{
    String url = 'https://admin.organicdeal.in/api/ProductAPI/HotDetails';
    try{
      http.Response r = await http.get(Uri.parse(url),);
      if(r.statusCode == 200){
        ProductModel hotDetailsModel = productModelFromJson(r.body);
        return hotDetailsModel;
      }
    }catch (error){
      print('hotDetailsError: ${error}');
      return;
    }
  }
  //Recommend product
  static RecommendProductApi()async{
    String url = 'https://admin.organicdeal.in/api/ProductAPI/ReccomendedProduct';
    try{
      http.Response r = await http.get(Uri.parse(url),);
      if(r.statusCode == 200){
      final   recommendProduct = recommendProductFromJson(r.body);
        print("recommendProduct&&&&&&&&&&&&&&&&:${recommendProduct.recommendProducts?[0].productName}");
        return recommendProduct;
      }
    }catch (error){
      print('RecommendedError: ${error}');
      return;
    }
  }
  // bulk order
  static registerApi(var Fullname,var CompanyName,var Phone,var Email,var Address,var City,var State,var Pincode,var Message,) async {
    try {
      var url = 'https://admin.organicdeal.in/api/Customer/Bulkorder';
      http.Response r = await http.post(
        Uri.parse(url),
        headers: {
          "content-type" : "application/json",
          "accept" : "application/json",
        },
        body: jsonEncode({
          "Fullname": Fullname,
          "CompanyName": CompanyName,
          "Phone": Phone,
          "Email":Email,
          "Address":Address,
          "City":City,
          "State": State,
          "Pincode": Pincode,
          "Message": Message,
        }),
      );
      print(r.body);
      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Error', 'SignUp Fail');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }
  // signup register
  static registerApi1(var Fullname,var Phone,var Email,var Password) async {
    try {
      var url = 'https://admin.organicdeal.in/api/Customerapi/Registration';
      http.Response r = await http.post(
        Uri.parse(url),
        headers: {
          "content-type" : "application/json",
          "accept" : "application/json",
        },
        body: jsonEncode({
          "FullName": Fullname,
          "Phone": Phone,
          "Email_Id":Email,
          "Password":Password,
        }),
      );
      print(r.body);
      if (r.statusCode == 200) {
        print("Register: ${r.body}");
        return r;
      } else {
        Get.snackbar('Error', 'SignUp Fail');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }
  // verify otp...
  static verifyOtp(var mobile,var otp) async {
    print("otp: $otp");
    print("$mobile");
    try {
      var url = 'https://admin.organicdeal.in/api/Customerapi/OtpVerifywithRegistration';
      http.Response r = await http.post(Uri.parse(url),
        // headers: {
        //   "content-type" : "application/json",
        //   "accept" : "application/json",
        // },
        body: {
          "MobileOrEmail":mobile,
          "Otp":otp
        },
      );
      Get.snackbar("", "${json.decode(r.body)["Message"]}");
      if (r.statusCode == 200) {
        print("Verify otp: ${json.decode(r.body)["Message"]}");
        Get.snackbar("", "${json.decode(r.body)["Message"]}");
        return r;
      } else {
        Get.snackbar('Error', 'SignUp Fail');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }
//////// Todo Login Email Api..................
  static LoginEmailApi(var Email_Id,var Password) async {
    var url = 'https://admin.organicdeal.in/api/Customerapi/LoginWithEmail';
    var body = {
      "Email_Id": Email_Id,
      "Password": Password,
    };
    http.Response r = await http.post(Uri.parse(url),
      body: body,
      //headers: headers
    );
    if (r.statusCode == 200)  {
     var userId=json.decode(r.body)['User_Id'];
        SharedPreferences prefs =  await SharedPreferences.getInstance();
        prefs.setString("userId", "${userId}");
      Get.snackbar(
          "Success",
          "Login successfully !",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          borderRadius: 5,
          backgroundColor:  green.withOpacity(0.5) ,
          icon: Image.asset("assets/images/check.png",scale: 20,color: green,),
          margin: const EdgeInsets.only(bottom: 5,left: 2,right: 2)
      );
     print("Login UserId: ${userId}");
      return r;
      } else {
        Get.snackbar(
          "Failed",
          "Login Failed !",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          borderRadius: 5,
          backgroundColor:  Colors.red.shade200 ,
          icon: Icon(Icons.cancel_outlined,color: Colors.red,),
          margin: const EdgeInsets.only(bottom: 5,left: 2,right: 2)
      );
      return r;
    }
  }
  //todo Product Api(sub category).......
  static SubProductsApi()async{
    var prefs = GetStorage();
    var Id=prefs.read("categoryId");
    print("SubProductApiId&&&&&&&&&&&&&&&&:${Id}");
    String url = 'https://admin.organicdeal.in/api/ProductAPI/GetProduct/categoryId?categoryId=$Id&page=1';
    try{
      http.Response r = await http.get(Uri.parse(url),);
      if(r.statusCode == 200){
        final subproductsModel = subproductsModelFromJson(r.body);
        print("ProductModel&&&&&&&&&&&&&&&&:${subproductsModel.products?[0].categoryName}");
        return subproductsModel;
      }
    }catch (error){
      print('SubProductModelError: ${error}');
      return;
    }
  }
  //todo Add to cart Api
  static AddToCartApi(var productId,) async {
    var url = 'https://admin.organicdeal.in/api/CartApi/AddToCart';//'https://admin.organicdeal.in/api/CartApi/AddToCart';
   SharedPreferences prefs = await SharedPreferences.getInstance();
     var uId= prefs.getString("userId");
    print('&&&&&&&&&&&&&&&&&&&&&&usercart:${uId}');
    print('&&&&&&&&&&&&&&&&&&&&&&ProductId:${productId}');
    var body = {
      "User_Id":"${uId}",
      "Product_Id":"$productId",
      "Weight":"70",
      "Metric_Id":"1",
      "VendorId":"37"
    };
    http.Response r = await http.post(Uri.parse(url),
      body: body,
    );
    print(r.body);
    if (r.statusCode == 200) {
      Get.snackbar('Sucess', 'Added cart Sucessfully');
      print("Added cart Sucessfully: ${r.body}");
      return r;
    } else {
      Get.snackbar('Message', 'Already Added');
      return r;
    }
  }
  // todo Get Cart List api ....
  static CartListApi()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uId= prefs.getString("userId");
    String url = 'https://admin.organicdeal.in/api/CartApi/GetCartList?userId=$uId';
    print('&&&&&&&&&&&&&&&&&&&&&&url:${url}');
    try{
      http.Response r = await http.get(Uri.parse(url),);
      if(r.statusCode == 200){
        final cartListModel =  cardListModelFromJson(r.body);
        return cartListModel;
      }
    }catch (error){
      print('CartListError: ${error}');
      return;
    }
  }
  // todo RemoveListItemFrom Cart api ....
  static RemoveListItemApi(productId)async{
    String url = 'https://admin.organicdeal.in/api/CartApi/RemoveItemFromCart?cartDetail_Id=$productId';
    print("uuuuuuuuuuuurl: ${url}");
    http.Response r = await http.post(Uri.parse(url),);
    if(r.statusCode == 200){
      Get.snackbar("Message", r.body);
      return r;
    }
  }
  // todo increment++ quantity ....
  static IncrementQuantityApi(id)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uId= prefs.getString("userId");
    String url = 'https://admin.organicdeal.in/api/CartApi/PlusToCart';
    http.Response r = await http.post(Uri.parse(url),
    body: {
      "Product_Id": "$id",
      "User_Id": "$uId"
    });
    if(r.statusCode == 200){
    //  Get.snackbar("Message", r.body);
      return r;
    }
  }
  // todo decrement-- quantity ....
  static DecrementQuantityApi(productId)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uId= prefs.getString("userId");
    String url = 'https://admin.organicdeal.in/api/CartApi/minusToCart';
    http.Response r = await http.post(Uri.parse(url),
        body: {
          "Product_Id": "$productId",
          "User_Id": "$uId"
        });
    if(r.statusCode == 200){
     // Get.snackbar("Message", r.body);
      return r;
    }
  }
  /// todo post coupon .........
  static applyCoupon(couponCode) async{
    print(couponCode);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uId= prefs.getString("userId");
    var url = "https://admin.organicdeal.in/api/AdminApi/DiscountCoupon";
    http.Response r = await http.post(Uri.parse(url),
    body: {
      "CompanyCoupon":"$couponCode",
      "User_ID":"$uId"
        });
    if(r.statusCode == 200){
      var price = json.decode(r.body)["totalPriceAfterDeductedAmt"];
      var price3 = price.toString();
      prefs.setString("totalPriceAfterDeductedAmt", "$price3");
      var price2=prefs.get("totalPriceAfterDeductedAmt");

      final datacount = GetStorage();
      datacount.write("count", price);
     var price1 = datacount.read('count');

      print("Apply Coupon response: ${price1}");
      print("Apply Coupon response2: ${price2}");
      return r;
    }
  }
  /// get Coupon List Api..............
  static CouponListApi() async{
   try{
     String url = 'https://admin.organicdeal.in/api/AdminApi/CouponList';
     http.Response r = await http.get(Uri.parse(url));
     if(r.statusCode == 200){
       final couponListModel = couponListModelFromJson(r.body);
       print("CouponListApi: ${couponListModel.result?[0].name}");
       return couponListModel;
     }
   }catch(error){
     print("Coupon List error: $error");
   }
    }
 static DeliveryAddressSelectApi() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var uId= prefs.getString("userId");
  try{
    var url = 'https://admin.organicdeal.in/api/CartApi/GetAddress?User_Id=$uId';
   http.Response r = await http.get(Uri.parse(url));
   if(r.statusCode==200){
     final addressSelectModel = addressSelectModelFromJson(r.body);
     return addressSelectModel;
   }
  }catch(error){
    print("Address list error: $error");
  }
    }
 /// order success api...........
 static OrderSuccessApi() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   var uId= prefs.getString("userId");
    var url = 'https://admin.organicdeal.in/api/CartApi/Order';
    http.Response r = await http.post(Uri.parse(url),
    body: {
      "User_Id": "$uId",
      "Status": "false"
    });
    if(r.statusCode == 200){
        print("order successful: ${r.body}");
      return r;
    }
    }
    static OrderCancelApi() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var uId= prefs.getString("userId");
   try{
     var url = 'https://admin.organicdeal.in/api/Checkoutapi/GetOrderCancel?U_Id=$uId';
     http.Response r = await http.get(Uri.parse(url));
     if(r.statusCode == 200){
       final cancelOrderModel = cancelOrderModelFromJson(r.body);
       return cancelOrderModel;
     }
   }catch(error){
     print("OrderCancelApi: $error");
   }
    }
    static OrderHistoryApi() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var uId= prefs.getString("userId");
  try{
    var url = 'https://admin.organicdeal.in/api/Checkoutapi/OrderHistory?urdt=$uId';
    http.Response r = await http.get(Uri.parse(url));
    if(r.statusCode == 200){
      final orderHistoryApiModel = orderHistoryApiModelFromJson(r.body);
      print("OrderHistoryApi: ${orderHistoryApiModel.result?[0].productName}");
      return orderHistoryApiModel;
    }
  }catch(error) {
    print("OrderHistoryError: $error");
  }
    }
  static UserProfile() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var uId= prefs.getString("userId");
   try{
     var url = 'http://admin.organicdeal.in/api/Customerapi/UserProfile?User_Id=$uId';
     http.Response r = await http.get(Uri.parse(url));
     if(r.statusCode == 200) {
       final userProfileModel = userProfileModelFromJson(r.body);
       return userProfileModel;
     }
    }catch(error){
     print("User Profile Error: $error");
   }
    }
    static AddAddress(var fname,var lname,var phone,var houseno,var apartmentname,var street,var landmark,
        var district,var pin,nickName) async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var uId= prefs.getString("userId");
    var url = 'https://admin.organicdeal.in/api/CartApi/AddToAddress';
    final body = {
      "FirstName": "$fname",
      "LastName": "$lname",
      "ContactNumber": "$phone",
      "HouseNo": "$houseno",
      "AppertmentName" :"$apartmentname",
      "StreetDetail": "$street",
      "Landmark": "$landmark",
      "AreaDetail": "gfgfgffg",
      "CityDistrict": "$district",
      "Pincode": "$pin",
      "NickNameThisAddressas": "$nickName",
      "User_ID": "$uId"
    };
    print("new address: ${body}");
    http.Response r = await http.post(Uri.parse(url),
    body: body);
    if(r.statusCode == 200){
      print("Address added successfully");
      Get.snackbar("Success", "Added Successfully");
      return r;
    }
    }
    /// todo subtotal in address select page.....
  static SubTotalApi() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uId= prefs.getString("userId");
    try{
      var url = 'https://admin.organicdeal.in/api/CartApi/GetCartListOrder?userId=$uId';
      http.Response r = await http.get(Uri.parse(url));
      if(r.statusCode == 200) {
        final subTotalModel = subTotalModelFromJson(r.body);
        print("${subTotalModel.newmodeld?.grandTotals}");
        return subTotalModel;
      }
    }catch(error){
      print("Sub Total Error: $error");
    }
  }
  static OrderDetailPage() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var orderId=prefs.getString("OrderId");
    try{
      var url = 'https://admin.organicdeal.in/api/Checkoutapi/OrderDetail?oid=$orderId';
      print("OrderDetailApi: $url");
      http.Response r = await http.get(Uri.parse(url));
      if(r.statusCode==200){
        final orderDetailPageModel = orderDetailPageModelFromJson(r.body);
       // List<OrderDetailPageModel> orderDetailPageModel =orderDetailPageModelFromJson(r.body);
        //final orderDetailPageModel = orderDetailPageModelFromJson(r.body);
        return orderDetailPageModel;
      }
    }catch(error){
        print("OrderDetailPageError: ${error}");
    }
  }
  ///todo Cancel Order ......
  static CancelOrderApi(var orderno)async{
    print("OrderNumber: $orderno");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uId= prefs.getString("userId");
    var uuId = int.parse(uId.toString());
    var body = {
      "Id": "${orderno}",
      "Client_Id": "${uId}"
    };
    var url = 'https://admin.organicdeal.in/api/Checkoutapi/OrderCancel';
    http.Response r = await http.post(Uri.parse(url),
    body: body);
    print("${body}");
    if(r.statusCode == 200){
     Get.snackbar("Success", r.body);
      return r;
    }
  }
  /// todo Add Wallet Amount...
  static AddWallet(var amount)async{
    print("AddWallet Amount: ${amount}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uId= prefs.getString("userId");
    var url = 'https://admin.organicdeal.in/api/Customerapi/AddWalletAmount';
    http.Response r = await http.post(Uri.parse(url),
    body:{
      "User_Id": uId,
      "Mebr_Amount":amount
    });
    if(r.statusCode == 200){
      Get.snackbar("Success", "amount Add Successfully");
      print("Add success: ${r.body}");
      return r;
    }
  }
  static getWalletAmount()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uId= prefs.getString("userId");
   try{
     var url = 'https://admin.organicdeal.in/api/Customerapi/GetAmountBy?id=$uId';
     http.Response r = await http.get(Uri.parse(url));
     if(r.statusCode == 200){
       final getWalletAmountModel = getWalletAmountModelFromJson(r.body);
       return getWalletAmountModel;
     }
   }catch(error){
     print("WalletAmountError: $error");
   }
  }
  /// todo Invoice api.....
  static InvoiceApi()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
   var id = prefs.getString("id",);
   var orderId = prefs.getString("orderId",);
    var url = 'https://admin.organicdeal.in/api/CartApi/GeneratePdf?oid=$id&id=$orderId';
    print("InvoiceUrl: ${url}");
    http.Response r = await http.get(Uri.parse(url));
    if(r.statusCode==200){
      final invoiceModel = invoiceModelFromJson(r.body);
     // Get.to(InvoicePage(invoice: invoiceModel.invoicePath.toString(),));
      prefs.setString("invoice", "${invoiceModel.invoicePath}");
      print("InvoiceData:${invoiceModel.invoicePath}");
      return invoiceModel;
    }
  }
}