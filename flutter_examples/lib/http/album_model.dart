class AlbumModel {
  AlbumModel();

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel()
      ..userId = (json['userId'] as int?)
      ..id = (json['id'] as int?)
      ..title = (json['title'] as String?);
  }

  int? userId;
  int? id;
  String? title;
}
