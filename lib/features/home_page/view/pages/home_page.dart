import 'package:aifer_education_machine_test/features/home_page/controller/image_controller.dart';
import 'package:aifer_education_machine_test/features/home_page/view/widgets/show_download_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final images = ref.watch(imageControllerProvider.notifier).getImages();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 76, 129),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 76, 129),
        title: const Center(
          child: Text(
            "Trending Wallpapers",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: images,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data != null) {
              final images = snapshot.data;
              return MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemCount: images!.photos.length,
                itemBuilder: (context, index) {
                  final image = images.photos[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: InkWell(
                          onTap: () {
                            showDownloadDialog(
                                context, image.originalPhotoUrl, image.alt);
                          },
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(image.mediumPhotoUrl),
                                fit: BoxFit.cover,
                              ),
                              Text(image.alt)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Text('No data found');
            }
          } else {
            // Default case
            return const Text('Something went wrong!');
          }
        },
      ),
    );
  }
}
