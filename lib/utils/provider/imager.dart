import 'dart:typed_data';
import 'package:flutter/material.dart';

class Imager {
  static ImageProvider<Object> get<T>(T imagePath) {
    if (imagePath is String) {
      if (imagePath.startsWith('http') || imagePath.startsWith('https')) {
        return NetworkImage(imagePath);
      } else {
        return AssetImage(imagePath);
      }
    } else if (imagePath is ImageProvider<Object>) {
      return imagePath;
    } else {
      return createDummyImage(Colors.grey,int.parse(kToolbarHeight.toString()),int.parse(kToolbarHeight.toString()));
    }
  }
  static ImageProvider createDummyImage(Color color,int width,int height ) {

    final pixels = List<int>.filled(width * height * 4, 0);

    for (int i = 0; i < pixels.length; i += 4) {
      pixels[i] = color.red;
      pixels[i + 1] = color.green;
      pixels[i + 2] = color.blue;
      pixels[i + 3] = color.alpha;
    }

    final image = Image.memory(
      Uint8List.fromList(pixels),
      width: double.parse(width.toString()),
      height:double.parse(height.toString()),
    );

    return image.image;
  }

}
