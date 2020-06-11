class BannerModel {
  int id;
  String bannerName;
  String banner;
  String bannerType;
  String bannerUrl;
  Null goodsId;
  String deleteState;
  String createTime;
  String updateTime;

  BannerModel(
      {this.id,
      this.bannerName,
      this.banner,
      this.bannerType,
      this.bannerUrl,
      this.goodsId,
      this.deleteState,
      this.createTime,
      this.updateTime});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerName = json['bannerName'];
    banner = json['banner'];
    bannerType = json['bannerType'];
    bannerUrl = json['bannerUrl'];
    goodsId = json['goodsId'];
    deleteState = json['deleteState'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bannerName'] = this.bannerName;
    data['banner'] = this.banner;
    data['bannerType'] = this.bannerType;
    data['bannerUrl'] = this.bannerUrl;
    data['goodsId'] = this.goodsId;
    data['deleteState'] = this.deleteState;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    return data;
  }
}

class HomeIcon {
  String img;
  String name;
  String classifyId;

  HomeIcon({this.img, this.name, this.classifyId});

  HomeIcon.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    classifyId = json['classifyId'];
  }
}
