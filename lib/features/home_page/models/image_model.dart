class PhotoResponseModel {
  final List<Photo> photos;

  PhotoResponseModel({
    required this.photos,
  });

  factory PhotoResponseModel.fromJson(Map<String, dynamic> json) {
    return PhotoResponseModel(
      photos: List<Photo>.from(
        json['photos'].map((photo) => Photo.fromJson(photo)),
      ),
    );
  }
}

class Photo {
  final int id;
  final String url;
  final String photographer;
  final String mediumPhotoUrl;
  final String originalPhotoUrl;
  final String alt;

  Photo({
    required this.id,
    required this.url,
    required this.photographer,
    required this.mediumPhotoUrl,
    required this.originalPhotoUrl,
    required this.alt,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      url: json['url'],
      photographer: json['photographer'],
      mediumPhotoUrl: json['src']['medium'],
      originalPhotoUrl: json['src']['original'],
      alt: json['alt'],
    );
  }
}
