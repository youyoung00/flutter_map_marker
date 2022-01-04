import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class LocationService {
  final String key = 'AIzaSyCSdKtKIRtI8HfVqKLBpOq4-HFFqiLos0M';

  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeId = json['candidates'][0]['place_id'] as String;
    print(placeId);
    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
    // 'https://maps.googleapis.com/maps/api/place/details/json?place_id=ChIJzzlcLQGifDURm_JbQKHsEX4&key=AIzaSyCSdKtKIRtI8HfVqKLBpOq4-HFFqiLos0M';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;
    print(results);
    return results;
  }
}
