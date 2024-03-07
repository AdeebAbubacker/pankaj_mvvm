import 'package:panakj_app/core/model/event_gallery/event_gallery.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GalleryService {
  Future<EventGallery> getGalleryData() async {
    try {
      final response = await http.get(Uri.parse('https://ptvue.tekpeak.in/api/dropdown_values'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        EventGallery eventGallery = EventGallery.fromJson(data);
        return eventGallery;
      } else {
        // Handle error if the request was not successful
        print('Failed to load dropdown data, status code: ${response.statusCode}');
        throw Exception('Failed to load dropdown data');
      }
    } catch (e) {
      // Handle any other exceptions
      print('Error retrieving dropdown data: $e');
      throw e;
    }
  }
}
