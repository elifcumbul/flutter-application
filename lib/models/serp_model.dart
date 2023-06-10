// class SerpModel {
//   List<EventsResults>? eventsResults;

//   SerpModel({this.eventsResults});

//   SerpModel.fromJson(Map<String, dynamic> json) {
//     if (json['events_results'] != null) {
//       eventsResults = <EventsResults>[];
//       json['events_results'].forEach((v) {
//         eventsResults!.add(new EventsResults.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.eventsResults != null) {
//       data['events_results'] =
//           this.eventsResults!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class EventsResults {
//   String? title;
//   Date? date;
//   List<String>? address;
//   String? link;
//   EventLocationMap? eventLocationMap;
//   String? description;
//   Venue? venue;
//   String? thumbnail;
//   String? image;

//   EventsResults(
//       {this.title,
//       this.date,
//       this.address,
//       this.link,
//       this.eventLocationMap,
//       this.description,
//       this.venue,
//       this.thumbnail,
//       this.image});

//   EventsResults.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     date = json['date'] != null ? new Date.fromJson(json['date']) : null;
//     address = json['address'].cast<String>();
//     link = json['link'];
//     eventLocationMap = json['event_location_map'] != null
//         ? new EventLocationMap.fromJson(json['event_location_map'])
//         : null;
//     description = json['description'];
//     venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
//     thumbnail = json['thumbnail'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = title;
//     if (date != null) {
//       data['date'] = date!.toJson();
//     }
//     data['address'] = address;
//     data['link'] = link;
//     if (eventLocationMap != null) {
//       data['event_location_map'] = eventLocationMap!.toJson();
//     }
//     data['description'] = description;
//     if (venue != null) {
//       data['venue'] = venue!.toJson();
//     }
//     data['thumbnail'] = thumbnail;
//     data['image'] = image;
//     return data;
//   }
// }

// class Date {
//   String? startDate;
//   String? when;

//   Date({this.startDate, this.when});

//   Date.fromJson(Map<String, dynamic> json) {
//     startDate = json['start_date'];
//     when = json['when'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['start_date'] = startDate;
//     data['when'] = when;
//     return data;
//   }
// }

// class EventLocationMap {
//   String? image;
//   String? link;
//   String? serpapiLink;

//   EventLocationMap({this.image, this.link, this.serpapiLink});

//   EventLocationMap.fromJson(Map<String, dynamic> json) {
//     image = json['image'];
//     link = json['link'];
//     serpapiLink = json['serpapi_link'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['image'] = image;
//     data['link'] = link;
//     data['serpapi_link'] = serpapiLink;
//     return data;
//   }
// }

// class Venue {
//   String? name;
//   String? link;

//   Venue({this.name, this.link});

//   Venue.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     link = json['link'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = name;
//     data['link'] = link;
//     return data;
//   }
// }

class SerpModel {
  List<EventsResults>? eventsResults;

  SerpModel({this.eventsResults});

  SerpModel.fromJson(Map<String, dynamic> json) {
    if (json['events_results'] != null) {
      eventsResults = <EventsResults>[];
      json['events_results'].forEach((v) {
        eventsResults!.add(new EventsResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eventsResults != null) {
      data['events_results'] =
          this.eventsResults!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventsResults {
  String? title;
  Date? date;
  List<String>? address;
  String? description;

  EventsResults({this.title, this.date, this.address, this.description});

  EventsResults.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'] != null ? new Date.fromJson(json['date']) : null;
    address = json['address'].cast<String>();
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    data['address'] = this.address;
    data['description'] = this.description;
    return data;
  }
}

class Date {
  String? startDate;
  String? when;

  Date({this.startDate, this.when});

  Date.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    when = json['when'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_date'] = this.startDate;
    data['when'] = this.when;
    return data;
  }
}