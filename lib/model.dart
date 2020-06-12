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
class HomeTab {
  String img;
  String name;
  String subhead;

  HomeTab({this.img, this.name, this.subhead});

  HomeTab.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    subhead = json['subhead'];
  }
}

class CommentList<T> {
  int total;
  List<T> rows;

  CommentList({this.total,this.rows});

  CommentList.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    rows = json['rows'];
  }
}


class News {
  int id;
  String img;
  String title;
  String subtitle;
  Null keyword;
  String username;
  Null name;
  Null source;
  String link;
  int browse;
  int transpond;
  Null digest;
  Null content;
  String stick;
  Null editing;
  String createTime;
  Null updateTime;
  String classifyId;
  Null deleteState;
  String audit;
  String typeId;
  String isfocus;

  News(
      {this.id,
        this.img,
        this.title,
        this.subtitle,
        this.keyword,
        this.username,
        this.name,
        this.source,
        this.link,
        this.browse,
        this.transpond,
        this.digest,
        this.content,
        this.stick,
        this.editing,
        this.createTime,
        this.updateTime,
        this.classifyId,
        this.deleteState,
        this.audit,
        this.typeId,
        this.isfocus});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    title = json['title'];
    subtitle = json['subtitle'];
    keyword = json['keyword'];
    username = json['username'];
    name = json['name'];
    source = json['source'];
    link = json['link'];
    browse = json['browse'];
    transpond = json['transpond'];
    digest = json['digest'];
    content = json['content'];
    stick = json['stick'];
    editing = json['editing'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    classifyId = json['classifyId'];
    deleteState = json['deleteState'];
    audit = json['audit'];
    typeId = json['typeId'];
    isfocus = json['isfocus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['keyword'] = this.keyword;
    data['username'] = this.username;
    data['name'] = this.name;
    data['source'] = this.source;
    data['link'] = this.link;
    data['browse'] = this.browse;
    data['transpond'] = this.transpond;
    data['digest'] = this.digest;
    data['content'] = this.content;
    data['stick'] = this.stick;
    data['editing'] = this.editing;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['classifyId'] = this.classifyId;
    data['deleteState'] = this.deleteState;
    data['audit'] = this.audit;
    data['typeId'] = this.typeId;
    data['isfocus'] = this.isfocus;
    return data;
  }
}