
// class UserModel {
//   Users? users;

//   UserModel({this.users});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     users = json['users'] != null ? new Users.fromJson(json['users']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.users != null) {
//       data['users'] = this.users!.toJson();
//     }
//     return data;
//   }
// }

// class Users {
//   String? name;
//   String? surname;
//   String? photoUrl;
//   String? events;
//   String? participants;
//   String? id;
//   String? userName;
//   String? email;

//   Users(
//       {this.name,
//       this.surname,
//       this.photoUrl,
//       this.events,
//       this.participants,
//       this.id,
//       this.userName,
//       this.email});

//   Users.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     surname = json['surname'];
//     photoUrl = json['photoUrl'];
//     events = json['events'];
//     participants = json['participants'];
//     id = json['id'];
//     userName = json['userName'];
//     email = json['email'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = name;
//     data['surname'] = surname;
//     data['photoUrl'] = photoUrl;
//     data['events'] = events;
//     data['participants'] = participants;
//     data['id'] = id;
//     data['userName'] = userName;
//     data['email'] = email;
//     return data;
//   }
// }


class UserModel {
  Users? users;

  UserModel({this.users});

  UserModel.fromJson(Map<String, dynamic> json) {
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    return data;
  }
}

class Users {
  String? name;
  String? surname;
  String? photoUrl;
  List<Events>? events;
  String? participants;
  String? id;
  String? userName;
  String? email;

  Users(
      {this.name,
      this.surname,
      this.photoUrl,
      this.events,
      this.participants,
      this.id,
      this.userName,
      this.email});

  Users.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    photoUrl = json['photoUrl'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
    participants = json['participants'];
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['surname'] = surname;
    data['photoUrl'] = photoUrl;
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    data['participants'] = participants;
    data['id'] = id;
    data['userName'] = userName;
    data['email'] = email;
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