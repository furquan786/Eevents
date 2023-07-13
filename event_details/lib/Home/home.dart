// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:event_details/Instance/EventInstance.dart';
import 'package:event_details/EventsDetails/EventWidget.dart';
import 'package:event_details/Search_Screen/Search_Screen.dart';
import 'package:flutter/material.dart';

import '../EventsData/Event.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var eventsStream;

  @override
  void initState() {
    eventsStream = fetchEvents().asStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Events',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(18, 13, 38, 1),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 17),
            child: IconButton(
              icon: Icon(
                Icons.search,
                size: 28,
                color: Color.fromRGBO(18, 13, 38, 1),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: getBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBuilder() {
    return StreamBuilder(
      builder: (context, Snapshot) {
        if (Snapshot.hasError) {
          return Text("An error Occured");
        } else if (Snapshot.hasData) {
          List<Event>? events = Snapshot.data as List<Event>?;
          return EventWidget(
            events: events!,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      stream: eventsStream,
    );
  }
}
