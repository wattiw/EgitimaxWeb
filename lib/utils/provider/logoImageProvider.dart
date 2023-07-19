import 'package:egitimax/utils/provider/createDummyImage.dart';
import 'package:flutter/material.dart';

class LogoImageProvider {
  static ImageProvider<Object> getLogoImage<T>(T imagePath) {
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

}
