import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiMethods {
  //Method to break words with how many lines
  static String wrapWords(String text, int length) {
    return text.replaceAllMapped(
        RegExp('(.{1,$length})(?:\\s+|\$)'), (match) => '${match[1]}\n');
  }

  static Future<List<dynamic>> getItems() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        print('Response Body Type: ${responsebody.runtimeType}');
        print('Response Body Length: ${responsebody.length}');
        print('Response Body: $responsebody');

        print(responsebody[4]['id']);

        return responsebody;
      } else {
        throw Exception('Error while fetching data');
      }
    } catch (e) {
      throw Exception('Exception $e');
    }
  }

  static Future<Map<String,dynamic>> getItems2() async {
    var url = Uri.parse('https://dummyjson.com/products');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        print('Response Body Type: ${responsebody.runtimeType}');
        print('Response Body Length: ${responsebody.length}');
        print('Response Body: $responsebody');
     

        return responsebody;
      } else {
        throw Exception('Error while fetching data');
      }
    } catch (e) {
      throw Exception('Exception $e');
    }
  }

  static Future<Map<String,dynamic>> getItems3() async {
    var url = Uri.parse('http://127.0.0.1:8000/static/daura.jpg');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);

        return responsebody;
      } else {
        throw Exception('Error while fetching data');
      }
    } catch (e) {
      throw Exception('Exception $e');
    }
  }

}
