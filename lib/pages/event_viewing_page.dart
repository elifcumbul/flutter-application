import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:take_me_out/modals/event_details.dart';
import 'package:take_me_out/pages/homepage.dart';
import 'package:take_me_out/provider/event_provider.dart';

import '../tabs/event_editing_page_tab.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;

  const EventViewingPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          actions: buildViewingActions(context, event),
        ),
        body: ListView(
          padding: const EdgeInsets.all(32),
          children: <Widget>[
            buildDateTime(event),
            const SizedBox(height: 32),
            Text(
              event.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              event.description,
              style: const TextStyle(color: Colors.deepOrange, fontSize: 18),
            )
          ],
        ),
      );

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'All day' : 'From', event.from),
        if (!event.isAllDay) buildDate('To', event.to),
      ],
    );
  }

  buildDate(String title, DateTime date) {
    //Container
  }

  List<Widget> buildViewingActions(BuildContext context, Event event) {
    return [
      IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => EventEditingPage(event: event),
          ),
        ),
      ),
      IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          final provider = Provider.of<EventProvider>(context, listen: true);

          provider.deleteEvent(event);
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          );
        },
      ),
    ];
  }
}