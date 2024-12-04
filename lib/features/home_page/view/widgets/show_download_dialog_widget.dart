import 'package:aifer_education_machine_test/features/home_page/services/images_services.dart';
import 'package:flutter/material.dart';

void showDownloadDialog(
    BuildContext context, String imageUrl, String imageName) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Download Image',
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Do you want to download this image?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '"$imageName"',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: const Text('Download'),
            onPressed: () async {
              // Call the download method
              await ImageApi.downloadImage(imageUrl, imageName);

              // Close the dialog
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
