class Event {
  final String image;
  final String title;
  final String date;
  final String location;
  final String description;
  final int id;
  final String OriganizerName;
  final String organiser_icon;
  final String country;
  final String venue_name;

  Event({
    required this.image,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.id,
    required this.OriganizerName,
    required this.organiser_icon,
    required this.country,
    required this.venue_name,
  });

  // @override
  // String toString() {
  //   return super.toString();
  // }
}
