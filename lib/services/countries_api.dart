import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:local_restaurants/models/countriesResponse.dart';

import '../config/api_config.dart';

class CountriesAPi {
  static Future<Object> getCountries() async {
    try {
      final response = await http
          .get(Uri.parse(ApiConfig().baseUrl + ApiConfig().allCountries));

      var jsonResponse = countries.fromJson(json.decode(response.body));

      if (response.statusCode == 200) {
        // print(await response.body);
        return jsonResponse;
      } else {
        print(response.reasonPhrase);
        return ('Inaccesible');
      }
    } on Exception catch (e) {
      // TODO
      return (e);
    }
  }
}
