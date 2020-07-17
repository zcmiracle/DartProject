class CategoryModel {
  String code;
  String message;
  List<Data> data;

  /// 构造方法
  CategoryModel({this.code, this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = List<Data>();
      json['data'].forEach((value) {
        data.add(Data.fromJson(value));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((value) => value.toJson()).toList();
    }
    return data;
  }
}


class Data {
  String firstCategoryId;
  String firstCategoryName;
  List<SecondCategoryVO> secondCategoryVO;
  Null comments;
  String image;

  Data({this.firstCategoryId, this.firstCategoryName, this.secondCategoryVO, this.comments, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    firstCategoryId = json['firstCategoryId'];
    firstCategoryName = json['firstCategoryName'];
    image = json['image'];
    comments = json['comments'];
    if (json['secondCategoryVO'] != null) {
      secondCategoryVO = List<SecondCategoryVO>();
      json['secondCategoryVO'].forEach((value) {
        secondCategoryVO.add(SecondCategoryVO.fromJson(value));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstCategoryId'] = this.firstCategoryId;
    data['firstCategoryName'] = this.firstCategoryName;
    data['image'] = this.image;
    data['comments'] = this.comments;

    if (this.secondCategoryVO != null) {
      data['secondCategoryVO'] = this.secondCategoryVO.map((value) => value.toJson()).toList();
    }
    return data;
  }
}

class SecondCategoryVO {
  String secondCategoryId;
  String firstCategoryId;
  String secondCategoryName;
  String comments;

  /// 构造方法
  SecondCategoryVO({this.secondCategoryId, this.firstCategoryId, this.secondCategoryName, this.comments});

  SecondCategoryVO.fromJson(Map<String, dynamic> json) {
    secondCategoryId = json['secondCategoryId'];
    firstCategoryId = json['firstCategoryId'];
    secondCategoryName = json['secondCategoryName'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String,dynamic>();
    data['secondCategoryId'] = this.secondCategoryId;
    data['firstCategoryId'] = this.firstCategoryId;
    data['secondCategoryName'] = this.secondCategoryName;
    data['comments'] = this.comments;
    return data;
  }
}