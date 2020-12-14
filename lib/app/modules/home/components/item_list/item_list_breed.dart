import 'package:flutter/material.dart';
import 'package:flutter_dogs/app/modules/home/home_controller.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ItemListBreed extends StatelessWidget {
  final HomeController controller = Modular.get();

  final Breed breed;

  ItemListBreed({this.breed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => controller.openBreed(breed),
      child: Text(this.breed.breedName),
    );
  }
}
