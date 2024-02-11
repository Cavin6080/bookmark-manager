class BookmarkDataModel {
  List<Data>? data;

  BookmarkDataModel({this.data});

  BookmarkDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userCreated;
  String? url;
  String? title;

  Data({
    this.id,
    this.url,
    this.userCreated,
    this.title,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCreated = json['user_created'];
    url = json['url'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_created'] = userCreated;
    data['url'] = url;
    data['title'] = title;
    return data;
  }
}
