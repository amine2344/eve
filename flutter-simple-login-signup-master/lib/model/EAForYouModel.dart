class EAForYouModel {
  String? hashtag;
  String? name;
  double? rating;
  String? add;
  String? attending;
  String? time;
  String? image;
  String? price;
  double? distance;
  bool? fev;
  String? host ;  

  EAForYouModel({this.hashtag, this.host, this.name, this.rating, this.add, this.attending, this.time, this.image, this.distance, this.price, this.fev = false});
}

class EAMessageModel {
  int? senderId;
  int? receiverId;
  String? msg;
  String? time;

  EAMessageModel({this.senderId, this.receiverId, this.msg, this.time});
}
