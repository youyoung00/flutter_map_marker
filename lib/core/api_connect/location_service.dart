import 'dart:convert' as convert;

import 'package:flutter_map_marker/core/urls/urls.dart';
import 'package:http/http.dart' as http;

import '../core/keys/keys.dart';

class LocationService {
  Future<String> getPlaceId(String input) async {
    final String url =
        '${Urls.baseUrl}findplacefromtext/json?input=$input&inputtype=textquery&key=${Keys.mapKey}';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeId = json['candidates'][0]['place_id'] as String;
    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url =
        '${Urls.baseUrl}details/json?place_id=$placeId&key=${Keys.mapKey}';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;
    return results;
  }
}
