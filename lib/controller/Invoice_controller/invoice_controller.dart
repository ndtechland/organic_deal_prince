import 'package:get/get.dart';
import 'package:organic_deal/model/invoice_model.dart';
import 'package:organic_deal/pages/MyOrder/invoicePage.dart';
import 'package:organic_deal/services/api_provider.dart';

class InvoiceController extends GetxController{
  RxBool isLoading = false.obs;
  InvoiceModel? invoiceModel;
  void getInvoiceApi() async{
    isLoading(true);
    invoiceModel = ApiProvider.InvoiceApi();
    if(invoiceModel?.invoicePath != null){
      isLoading(false);
      Get.to(PDFScreen());
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    getInvoiceApi();
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}