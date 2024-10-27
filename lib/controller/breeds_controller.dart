import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:sample_api_integration/model/breed_screen_model.dart';

class BreedsController with ChangeNotifier {
  List<Datum> breedsList = [];

  Future<void> getBreed() async {
    final url = Uri.parse("https://catfact.ninja/breeds");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var responseData = breedsModelFromJson(response.body);
        breedsList = responseData.data ?? [];
      }
    } catch (e) {
      print(e);
    }
  }
}
