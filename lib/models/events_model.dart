class EventsModel {
  List<Events>? events;

  EventsModel({this.events});

  EventsModel.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  String? name;
  String? description;
  String? eventTime;
  String? eventDate;
  String? categoryId;
  String? categories;
  String? creatorId;
  String? creator;
  String? participants;
  String? id;
  String? createdDate;

  Events(
      {this.name,
      this.description,
      this.eventTime,
      this.eventDate,
      this.categoryId,
      this.categories,
      this.creatorId,
      this.creator,
      this.participants,
      this.id,
      this.createdDate});

  Events.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    eventTime = json['eventTime'];
    eventDate = json['eventDate'];
    categoryId = json['categoryId'];
    categories = json['categories'];
    creatorId = json['creatorId'];
    creator = json['creator'];
    participants = json['participants'];
    id = json['id'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['description'] = description;
    data['eventTime'] = eventTime;
    data['eventDate'] = eventDate;
    data['categoryId'] = categoryId;
    data['categories'] = categories;
    data['creatorId'] = creatorId;
    data['creator'] = creator;
    data['participants'] = participants;
    data['id'] = id;
    data['createdDate'] = createdDate;
    return data;
  }
}