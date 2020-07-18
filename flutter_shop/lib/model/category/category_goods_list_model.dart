class CategoryGoodsListModel{
  String code;
  String message;
  List<CategoryListData> data;

  CategoryGoodsListModel({this.code, this.message, this.data});

  CategoryGoodsListModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = List<CategoryListData>();
      json['data'].forEach((v){
        data.add(CategoryListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if(this.data != null){
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryListData {
  String image;
  double oriPrice;
  double presentPrice;
  String name;
  String goodsId;

  CategoryListData({this.image, this.oriPrice, this.presentPrice, this.name, this.goodsId});

  CategoryListData.fromJson(Map<String, dynamic> json){
    image = json['image'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    name = json['name'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = this.image;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['name'] = this.name;
    data['goodsId'] = this.goodsId;
    return data;
  }
}


