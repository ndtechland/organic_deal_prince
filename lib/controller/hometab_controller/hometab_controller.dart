import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:organic_deal/model/home_banner_model.dart';
import 'package:organic_deal/model/homefilter_model.dart';
import 'package:organic_deal/model/hotdetails_model.dart';
import 'package:organic_deal/model/shopbycategory_model.dart';
import 'package:organic_deal/services/api_provider.dart';

class HomeTabController extends GetxController {
  RxBool isloading = false.obs;
  ShopByCategory? getshopbycategorylist;
  HomeBannerModel? getsliderbaner;
  List<HomeSearchModel>? gethomesearch;
  //late SpecialProductModel getspecialproducts;

  ProductModel? gethotDetails;

//location
  var latitude = 'Getting Latitude..'.obs;
  var longitude = 'Getting Longitude..'.obs;
  var address = ''.obs;
  late StreamSubscription<Position> streamSubscription;
  //
  final TextEditingController textController = TextEditingController();
  RxString controllerText = ''.obs;
  void sliderBannerApi() async {
    isloading(true);
    getsliderbaner = await ApiProvider.SliderBannerApi();
    if (getsliderbaner?.banner != null) {
      isloading(false);
    }
  }

  void shopByCategoryApi() async {
    isloading(true);
    getshopbycategorylist = await ApiProvider.ShopbyCategoryApi();
    if (getshopbycategorylist != null) {
      isloading(false);
    }
  }

  void homesearchApi(String text) async {
    // isloading(true);
    gethomesearch = await ApiProvider.HomeSearchApi(text);
    if (gethomesearch != null) {
      // isloading(false);
    }
  }

  //hot details
  void hotdetailsApi() async {
    isloading(true);
    gethotDetails = await ApiProvider.HotDetailsApi();
    if (gethotDetails != null) {
      isloading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    sliderBannerApi();
    shopByCategoryApi();
    getLocation();
    // recommendproductApi();
    //homesearchApi('');
    // textController.addListener(() {
    //   controllerText.value = textController.text;
    // });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    streamSubscription.cancel();
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      latitude.value = 'Latitude : ${position.latitude}';
      //longitude.value = 'Longitude : ${position.longitude}';
      getAddressFromLatLang(position);
    });
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value =
        '${place.street},' '${place.subLocality},' '${place.locality}';
  }
}
