// class AllUsersModel {
//   List<Users>? users;

//   AllUsersModel({this.users});

//   AllUsersModel.fromJson(Map<String, dynamic> json) {
//     if (json['users'] != null) {
//       users = <Users>[];
//       json['users'].forEach((v) {
//         users!.add(new Users.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.users != null) {
//       data['users'] = this.users!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Users {
//   String? name;
//   String? surname;
//   String? photoUrl;
//   String? id;
//   String? userName;
//   String? email;

//   Users(
//       {this.name,
//       this.surname,
//       this.photoUrl,
//       this.id,
//       this.userName,
//       this.email});

//   Users.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     surname = json['surname'];
//     photoUrl = json['photoUrl'];
//     id = json['id'];
//     userName = json['userName'];
//     email = json['email'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = name;
//     data['surname'] = surname;
//     data['photoUrl'] = photoUrl;
//     data['id'] = id;
//     data['userName'] = userName;
//     data['email'] = email;
//     return data;
//   }
// }

class AllUsersModel {
  List<Users>? users;

  AllUsersModel({this.users});

  AllUsersModel.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
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
  String? normalizedUserName;
  String? email;

  Users(
      {this.name,
      this.surname,
      this.photoUrl,
      this.events,
      this.participants,
      this.id,
      this.userName,
      this.normalizedUserName,
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
    normalizedUserName = json['normalizedUserName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['photoUrl'] = this.photoUrl;
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    data['participants'] = this.participants;
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['normalizedUserName'] = this.normalizedUserName;
    data['email'] = this.email;
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
