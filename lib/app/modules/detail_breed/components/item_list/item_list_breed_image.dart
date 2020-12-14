import 'package:flutter/material.dart';
import 'package:flutter_dogs/app/modules/detail_breed/detail_breed_controller.dart';
import 'package:flutter_dogs/app/modules/detail_breed/models/breed_image.dart';

class ItemListBreedImage extends StatelessWidget {
  final BreedImage breedImage;

  ItemListBreedImage({this.breedImage});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      breedImage.urlPicture,
      fit: BoxFit.contain,
    );
  }
}
