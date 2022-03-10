import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../data/security_area/security_elements.dart';

class LocationService {
  Future<String> getPlaceId(String input) async {
    final String url =
        '${Elements.baseUrl}findplacefromtext/json?input=$input&inputtype=textquery&key=${Elements.mapKey}';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeId = json['candidates'][0]['place_id'] as String;
    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url =
        '${Elements.baseUrl}details/json?place_id=$placeId&key=${Elements.mapKey}';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;
    return results;
  }
}
