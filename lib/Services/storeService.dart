import 'dart:async';
import 'package:gowawe/model/storeModel.dart';
import 'package:http/http.dart' as http;



class StoreServie {
  Future<Object> getStore() async {
    try {

      http.Response response = await http.get(
          Uri.parse("https://gowawe.com/api/member-store-main"),
          headers: {
            "accept": "application/json",
          });

      if (response.statusCode == 200) {
        var storeData = storeModelFromJson(response.body);
        return storeData;
      } else {
        return false;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
