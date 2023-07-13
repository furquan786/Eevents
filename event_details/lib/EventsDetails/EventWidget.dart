// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:event_details/Constant/TextStyle.dart';
import 'package:event_details/EventsDetails/EventDetail.dart';
import 'package:flutter/material.dart';

import '../Constant/ImageURL.dart';
import '../EventsData/Event.dart';

class EventWidget extends StatelessWidget {
  List<Event> events;
  EventWidget({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: events.length,
      itemBuilder: (context, index) {
        Event event = events[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EventDetailPage(event: event),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.only(top: 9),
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            height: 106,
            width: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: ListTile(
              leading: Hero(
                  tag: Key(event.id.toString()),
                  child: ItemImage(imageUrl: event.image)),
              title: Text(
                event.title,
                style: boldstyle(Color.fromRGBO(18, 13, 38, 1), 15),
              ),
              subtitle: SizedBox(
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      event.date.replaceRange(10, event.date.length, ""),
                      style: ligthtstyle(Color.fromRGBO(86, 105, 255, 1), 13),
                    ),
                    Text(
                      event.location,
                      style: ligthtstyle(Color.fromRGBO(116, 118, 136, 1), 13),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
