import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter_application_1/model/user_model.dart';

class ApiService {
  String baseUrl = 'https://jsonplaceholder.typicode.com/';
  String endPoint = 'users';
  late String completepoint = '$baseUrl$endPoint';

  Future<List<User>?> getUsers() async {
    try {
      var url = Uri.parse(completepoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<User> user = parseUser(response.body);
        return user;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

List<User> parseUser(String responseBody) => List<User>.from(
    json.decode(responseBody).map((result) => User.fromJson(result)));
