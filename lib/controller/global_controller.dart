import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_api_integration/model/global_model.dart';

class GlobalController with ChangeNotifier {
  GlobalModel? obj;

  Future<void> getGlobal() async {
    final Url = Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json");

    try {
      var response = await http.get(Url);
      if (response.statusCode == 200) {
        print("Data Fetched");

        var convertedJson = jsonDecode(response.body);

        obj = GlobalModel.fromJson(convertedJson);

        print(response.body);
      }
    } catch (e) {
      log("$e");
    }

    notifyListeners();
  }
}
