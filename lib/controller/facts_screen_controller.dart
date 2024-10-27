import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_api_integration/model/facts_model.dart';

class FactsScreenController with ChangeNotifier {
  List<Datum>? dataList = [];

  Future<void> getFacts() async {
    final url = Uri.parse("https://catfact.ninja/facts");

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var responsefact = factsModelFromJson(response.body);
        dataList = responsefact.data ?? [];

        print(dataList);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
