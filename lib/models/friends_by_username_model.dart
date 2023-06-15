class FriendsByUsernameModel {
  Users? users;

  FriendsByUsernameModel({this.users});

  FriendsByUsernameModel.fromJson(Map<String, dynamic> json) {
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

// class FriendsByUsernameModel {
//   Users? users;

//   FriendsByUsernameModel({this.users});

//   FriendsByUsernameModel.fromJson(Map<String, dynamic> json) {
//     users = json['users'] != null ? new Users.fromJson(json['users']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (users != null) {
//       data['users'] = users!.toJson();
//     }
//     return data;
//   }
// }

// class Users {
//   String? name;
//   String? surname;
//   List<Events>? events;
//   String? id;
//   String? userName;
//   String? email;

//   Users(
//       {this.name,
//       this.surname,
//       this.events,
//       this.id,
//       this.userName,
//       this.email});

//   Users.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     surname = json['surname'];
//     if (json['events'] != null) {
//       events = <Events>[];
//       json['events'].forEach((v) {
//         events!.add(new Events.fromJson(v));
//       });
//     }
//     id = json['id'];
//     userName = json['userName'];
//     email = json['email'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = name;
//     data['surname'] = surname;
//     if (events != null) {
//       data['events'] = events!.map((v) => v.toJson()).toList();
//     }
//     data['id'] = id;
//     data['userName'] = userName;
//     data['email'] = email;
//     return data;
//   }
// }

// class Events {
//   String? name;
//   String? description;
//   String? eventTime;
//   String? eventDate;
//   String? categoryId;
//   String? creatorId;
//   String? id;
//   String? createdDate;

//   Events(
//       {this.name,
//       this.description,
//       this.eventTime,
//       this.eventDate,
//       this.categoryId,
//       this.creatorId,
//       this.id,
//       this.createdDate});

//   Events.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     description = json['description'];
//     eventTime = json['eventTime'];
//     eventDate = json['eventDate'];
//     categoryId = json['categoryId'];
//     creatorId = json['creatorId'];
//     id = json['id'];
//     createdDate = json['createdDate'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = name;
//     data['description'] = description;
//     data['eventTime'] = eventTime;
//     data['eventDate'] = eventDate;
//     data['categoryId'] = categoryId;
//     data['creatorId'] = creatorId;
//     data['id'] = id;
//     data['createdDate'] = createdDate;
//     return data;
//   }
// }