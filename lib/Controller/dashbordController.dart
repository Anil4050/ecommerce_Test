import 'dart:convert';
import 'package:tsc_tasc/global.dart' as global;
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class DashbordController extends GetxController {
  RxBool isLoading = false.obs;
  var productData;
  var oneProductData;
  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    await getProduct();
  }

  updateData(product) {
    productData = product;
    update();
  }

  UpdateSingleProduct(data) {
    oneProductData = data;
    update();
  }

  Future getProduct() async {
    http.Response response = await http.get(Uri.parse(global.productURL));
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        isLoading.value = false;
        print(decodedData);
        updateData(decodedData);

        return decodedData;
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }

  Future getProductByID(id) async {
    http.Response response =
        await http.get(Uri.parse("${global.productURL}/$id"));
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        isLoading.value = false;
        print(decodedData);
        UpdateSingleProduct(decodedData);

        return decodedData;
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }
}
