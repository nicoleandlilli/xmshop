///自动生成对象的类：

/// https://autocode.icu/jsontodart

class CategoryModel {
  CategoryModel({
    required this.result,
  });
  late final List<CategoryModelItem> result;

  CategoryModel.fromJson(Map<String, dynamic> json){
    result = List.from(json['result']).map((e)=>CategoryModelItem.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['result'] = result.map((e)=>e.toJson()).toList();
    return data;
  }
}

class CategoryModelItem {
  CategoryModelItem({
    required this.id,
    required this.title,
    required this.status,
    required this.pic,
    required this.pid,
    required this.sort,
    this.isBest,
    required this.goProduct,
    required this.productId,
  });
  late final String id;
  late final String title;
  late final int status;
  late final String pic;
  late final String pid;
  late final int sort;
  int? isBest;
  late final int goProduct;
  late final String productId;

  CategoryModelItem.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    pid = json['pid'];
    sort = json['sort'];
    isBest = json['is_best'];
    goProduct = json['go_product'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['pid'] = pid;
    data['sort'] = sort;
    data['is_best'] = isBest;
    data['go_product'] = goProduct;
    data['product_id'] = productId;
    return data;
  }
}