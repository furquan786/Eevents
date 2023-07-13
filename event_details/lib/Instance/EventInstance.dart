import 'package:http/http.dart' as http;
import 'dart:convert';

import '../EventsData/Event.dart';

Future<List<Event>> fetchEvents() async {
  final List<Event> events = [];
  try {
    final response = await http.get(Uri.parse(
        'https://sde-007.api.assignment.theinternetfolks.works/v1/event'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      for (var item in data['content']['data']) {
        Event event = Event(
          image: item['banner_image'],
          title: item['title'],
          date: item['date_time'],
          location: item['venue_city'],
          description: item['description'],
          id: item['id'],
          OriganizerName: item['organiser_name'],
          organiser_icon: item['organiser_icon'],
          country: item['venue_country'],
          venue_name: item['venue_name'],
        );
        events.add(event);
      }
    } else {
      throw Exception('Failed to fetch events');
    }
  } catch (e) {
    print("an error occur in fetchevent $e");
  }

  return events;
}

Future<List<Event>> searchevents(String query) async {
  final List<Event> events = [];
  try {
    final response = await http.get(Uri.parse(
        'https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=$query'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      for (var item in data['content']['data']) {
        Event event = Event(
          image: item['banner_image'],
          title: item['title'],
          date: item['date_time'],
          location: item['venue_city'],
          description: item['description'],
          id: item['id'],
          OriganizerName: item['organiser_name'],
          organiser_icon: item['organiser_icon'],
          country: item['venue_country'],
          venue_name: item['venue_name'],
        );
        events.add(event);
      }
    } else {
      throw Exception('Failed to fetch events');
    }
  } catch (e) {
    print("an error occur in fetchevent $e");
  }

  return events;
}
