import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final isNetworkImage = imagePath.contains('https://');
    final image = isNetworkImage ? NetworkImage(imagePath) : FileImage(File(imagePath)) as ImageProvider;

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Display the image
            Ink.image(
              image: image,
              fit: BoxFit.cover,
              width: 128,
              height: 128,
              child: InkWell(onTap: onClicked),
            ),
            // Add loading indicator for network images
            if (isNetworkImage)
              Positioned.fill(
                child: FutureBuilder(
                  future: _preloadNetworkImage(imagePath),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Failed to load image'),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _preloadNetworkImage(String url) async {
    final completer = Completer<void>();
    final image = NetworkImage(url);
    final imageStream = image.resolve(const ImageConfiguration());

    imageStream.addListener(
      ImageStreamListener(
            (info, _) => completer.complete(),
        onError: (error, stackTrace) => completer.completeError(error),
      ),
    );

    return completer.future;
  }


  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
