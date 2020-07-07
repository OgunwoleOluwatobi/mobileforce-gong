class Notes {
  String sId;
  String title;
  String content;
  String userID;
  bool important;
  String date;
  bool uploaded;
  bool shouldUpdate;

  Notes(
      {this.sId,
      this.title,
      this.content,
      this.userID,
      this.important,
      this.date,
      this.uploaded,
      this.shouldUpdate});

  Notes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    content = json['content'];
    userID = json['userID'];
    important = json['important'] == 1 ? true : json['important'] == 0 ? false : json['important'];
    date = json['date'];
    uploaded = json['uploaded'] == 1 ? true : json['uploaded'] == 0 ? false : json['uploaded'];
    shouldUpdate = json['shouldUpdate'] == 1 ? true : json['shouldUpdate'] == 0 ? false : json['shouldUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['userID'] = this.userID;
    data['important'] = this.important ? 1 : 0;
    data['date'] = this.date;
    data['uploaded'] = this.uploaded ? 1 : 0;
    data['shouldUpdate'] = this.shouldUpdate ? 1 : 0;
    return data;
  }
}
