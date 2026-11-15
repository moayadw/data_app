import 'package:flutter/material.dart';
import 'package:mydesign/model/post_model.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class ProviderGet extends ChangeNotifier {
  List<PostModel> posts = [];
  bool isLoading = false;
  Future<void> getPosts() async {
    isLoading = true;
    notifyListeners();
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    isLoading = false;
    notifyListeners();
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      posts = jsonData.map((json) => PostModel.fromJson(json)).toList();
    }
  }
}
