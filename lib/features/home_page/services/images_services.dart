import 'dart:convert';
import 'package:aifer_education_machine_test/features/home_page/models/image_model.dart';
import 'package:aifer_education_machine_test/features/home_page/services/storage_service.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ImageApi {
  static Future<PhotoResponseModel> getTrendingImages() async {
    final url =
        Uri.parse("https://api.pexels.com/v1/popular/?page=1&per_page=10");
    const headers = {
      "Authorization":
          "MJ6BQu2hYcewqFabFsMGgXHhX8QjREVEcoz7VDDYEcQYNQPxacXmfoix"
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        // Parse the response body into the PhotoResponse model.
        final jsonData = await json.decode(response.body);
        return PhotoResponseModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load wallpapers: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  static Future<void> downloadImage(String imageUrl, String imgname) async {
    Dio dio = Dio();

    // Request permission to write to external storage
    await PermissionService.requestPermission();

    //get the download path
    final downloadsDirectory = await PermissionService.directory();
    final filePath = '${downloadsDirectory.path}/${imgname}jpg';

    // Download the image
    await dio.download(imageUrl, filePath);
  }
}
