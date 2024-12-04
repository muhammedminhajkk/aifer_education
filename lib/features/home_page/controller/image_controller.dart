import 'package:aifer_education_machine_test/core/utils/snack_bar_utils.dart';
import 'package:aifer_education_machine_test/features/home_page/models/image_model.dart';
import 'package:aifer_education_machine_test/features/home_page/services/images_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'image_controller.g.dart';

@riverpod
class ImageController extends _$ImageController {
  @override
  PhotoResponseModel? build() {
    return null;
  }

  Future<PhotoResponseModel?> getImages() async {
    try {
      final imagedata = await ImageApi.getTrendingImages();
      return imagedata;
    } catch (e) {
      SnackBarUtils.showMessage("Failed to fetch images: ${e.toString()}");
      return null;
    }
  }
}
