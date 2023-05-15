class EventModel {
  int? index;
  String? title;
  String? description;
  String? date;
  String? startTime;
  String? endTime;
  String? category;

  EventModel({
    this.index,
    this.title,
    this.description,
    this.date,
    this.startTime,
    this.endTime,
    this.category,
  });


  EventModel.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['index'] = this.index;
    data['title'] = this.title;
    data['description'] = this.description;
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['category'] = this.category;

    return data;
  }
}

