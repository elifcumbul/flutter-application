class AiModel {
  List<RecommendedUsers>? recommendedUsers;
  String? targetUser;

  AiModel({this.recommendedUsers, this.targetUser});

  AiModel.fromJson(Map<String, dynamic> json) {
    if (json['recommended_users'] != null) {
      recommendedUsers = <RecommendedUsers>[];
      json['recommended_users'].forEach((v) {
        recommendedUsers!.add(new RecommendedUsers.fromJson(v));
      });
    }
    targetUser = json['target_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recommendedUsers != null) {
      data['recommended_users'] =
          this.recommendedUsers!.map((v) => v.toJson()).toList();
    }
    data['target_user'] = this.targetUser;
    return data;
  }
}

class RecommendedUsers {
  String? recommendedActivity;
  String? user;

  RecommendedUsers({this.recommendedActivity, this.user});

  RecommendedUsers.fromJson(Map<String, dynamic> json) {
    recommendedActivity = json['recommended_activity'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recommended_activity'] = recommendedActivity;
    data['user'] = user;
    return data;
  }
}