import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class LinkProvider extends ChangeNotifier {
  //https://cleanuri.com/api/v1/shorten
  //param:url (link to shorten) return result_url,error
  final mainUrl = "https://cleanuri.com/api/v1";
  final shortenUrl = "/shorten";
  String result = "";

  Future<String> shorten(String urlToShorten) async {
    EasyLoading.show();
    String postLink = mainUrl + shortenUrl;
    final response = await http.post(
      Uri.parse(postLink),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {"url": urlToShorten},
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      String resultUrl = jsonResponse['result_url'];
      result = resultUrl;
      notifyListeners();
      EasyLoading.showSuccess("Success: Your URL has been shortened!");
      return result;
    } else {
      String error = json.decode(response.body)['error'];
      EasyLoading.showError("Failed to shorten URL,$error");
      throw Exception('Failed to shorten URL');
    }
  }
}
