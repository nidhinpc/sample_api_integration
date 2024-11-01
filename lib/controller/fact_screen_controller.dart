import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_api_integration/model/fact_screen_model.dart';

class FactScreenController with ChangeNotifier {
  // var catFact;
  FactModel? resobj;

  bool isLoading = false;

  Future<void> getFact() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://catfact.ninja/fact");

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        //   print("data Fetched");
        var Convertedjson = jsonDecode(response.body);
        // resobj = FactModel(
        //     fact: Convertedjson["fact"], length: Convertedjson['length']);
        // //   catFact = Convertedjson["fact"];
        resobj = factModelFromJson(response.body);
        print(response.body);
        //    log(Convertedjson["fact"].toString());
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
