import 'package:flutter/material.dart';
import '../modals/events.dart';

class EventsDetailsPage extends StatefulWidget {
  final Events eventsModel;

  const EventsDetailsPage({super.key, required this.eventsModel});

  @override
  State<EventsDetailsPage> createState() => _EventsDetailsPageState();
}

class _EventsDetailsPageState extends State<EventsDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var heightSize = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ), //actions kısmını kendine göre ayarla
        title: const Text(
          "Events",
        ),
      ),
      body: SizedBox(
        height: heightSize,
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: heightSize - 110,
              child:Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Image.network(
                        widget.eventsModel.imageURL,
                        fit: BoxFit.cover,
                      ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.eventsModel.title,
                    style: TextStyle(color: Colors.amber)
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.amber
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.source,
                              color: Colors.amber
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(widget.eventsModel.source),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Colors.amber
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(widget.eventsModel.date.split('T').first),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.eventsModel.description,
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                  const Expanded(child: SizedBox(height: 40)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}