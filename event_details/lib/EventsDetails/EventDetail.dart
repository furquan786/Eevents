// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:event_details/Constant/TextStyle.dart';
import 'package:event_details/EventsData/Event.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  final Event event;
  EventDetailPage({required this.event});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250.0),
        child: AppBar(
          flexibleSpace: Hero(
            tag: Key(widget.event.id.toString()),
            child: Image.network(
              widget.event.image,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          title: Text(
            'Event Detail',
            style: boldstyle(Colors.white, 24),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).cardColor,
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.event.title,
                        style: boldstyle(Colors.black, 35),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        // color: Colors.black,
                        padding: EdgeInsets.only(left: 8),
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 50,
                              height: 51,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      NetworkImage(widget.event.organiser_icon),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.event.OriganizerName,
                                  style: ligthtstyle(
                                      Color.fromRGBO(13, 12, 38, 1), 15),
                                ),
                                Text(
                                  "Organizer",
                                  textAlign: TextAlign.left,
                                  style: ligthtstyle(
                                      Color.fromRGBO(112, 110, 143, 1), 12),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                        // color: Colors.black,
                        padding: EdgeInsets.only(left: 18),
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.calendar_month_sharp,
                              color: Colors.blue[300],
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.event.date.replaceRange(
                                      10, widget.event.date.length, ""),
                                  style: ligthtstyle(
                                      Color.fromRGBO(13, 12, 38, 1), 15),
                                ),
                                Text(
                                  "${widget.event.date.replaceRange(16, 25, " AM").replaceRange(0, 11, "")} -- ${widget.event.date.replaceRange(0, 20, "")} PM",
                                  textAlign: TextAlign.left,
                                  style: ligthtstyle(
                                      Color.fromRGBO(112, 110, 143, 1), 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                        // color: Colors.black,
                        padding: EdgeInsets.only(left: 18),
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.blue[300],
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.event.venue_name,
                                  style: ligthtstyle(
                                      Color.fromRGBO(13, 12, 38, 1), 15),
                                ),
                                Text(
                                  "${widget.event.location},${widget.event.country}",
                                  textAlign: TextAlign.left,
                                  style: ligthtstyle(
                                      Color.fromRGBO(112, 110, 143, 1), 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "About Event",
                        style: boldstyle(Color.fromRGBO(18, 13, 38, 1), 18),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.event.description,
                        style: ligthtstyle(Color.fromRGBO(18, 13, 38, 1), 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Text(
            //     "Nam id metus eget lectus dictum tincidunt. Sed euismod, leo id facilisis condimentum, metus est malesuada magna, eu euismod augue mi id magna. Sed in auctor nibh. Sed a mauris eget magna malesuada placerat eu eget libero. Sed auctor, magna at suscipit mollis, ligula tellus malesuada enim, non egestas augue metus id magna.")
          ],
        ),
      ),
    );
  }
}
