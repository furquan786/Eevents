// ignore_for_file: must_be_immutable, unnecessary_cast, prefer_const_constructors

import 'package:event_details/Constant/TextStyle.dart';
import 'package:event_details/EventsDetails/EventWidget.dart';
import 'package:event_details/Instance/EventInstance.dart';
import 'package:flutter/material.dart';

import '../EventsData/Event.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Event> filteredEvents = [];

  void getEvents(String query) async {
    filteredEvents = await searchevents(query);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
        title: Text(
          'Search',
          style: boldstyle(Color.fromRGBO(18, 13, 38, 1), 24),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              onChanged: (value) => getEvents(value),
              decoration: InputDecoration(
                  hintText: "Type Event Name",
                  hintStyle: ligthtstyle(Colors.grey, 20),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue[800],
                    size: 28,
                  ),
                  enabledBorder: InputBorder.none),
            ),
          ),
          Expanded(
            child: filteredEvents.isEmpty
                ? Center(
                    child: Text(
                      "No Results",
                      style: boldstyle(Colors.black, 20),
                    ),
                  )
                : EventWidget(events: filteredEvents),
          ),
        ],
      ),
    );
  }
}
