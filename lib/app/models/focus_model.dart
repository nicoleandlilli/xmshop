///自动生成对象的类：

/// https://autocode.icu/jsontodart

class FocusModel {
  FocusModel({
    required this.result,
  });
  late final List<FocusModelItem> result;

  FocusModel.fromJson(Map<String, dynamic> json){
    result = List.from(json['result']).map((e)=>FocusModelItem.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['result'] = result.map((e)=>e.toJson()).toList();
    return data;
  }
}

class FocusModelItem {
  FocusModelItem({
    required this.id,
    required this.title,
    required this.status,
    required this.pic,
    required this.url,
    required this.position,
  });
  late final String id;
  late final String title;
  late final String status;
  late final String pic;
  late final String url;
  late final int position;

  FocusModelItem.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['url'] = url;
    data['position'] = position;
    return data;
  }
}