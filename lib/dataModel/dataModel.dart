class DataModel {
  List<Info> info;

  DataModel({
    required this.info,
  });

}

class Info {
  String title;
  String sub;
  String imageUrl;

  Info({
    required this.title,
    required this.sub,
    required this.imageUrl,
  });

}
