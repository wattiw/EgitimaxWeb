
import 'dart:typed_data';

import 'package:flutter/material.dart';

ImageProvider createDummyImage(Color color,int width,int height ) {

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
