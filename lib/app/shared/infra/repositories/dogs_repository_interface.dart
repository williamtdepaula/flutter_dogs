import 'package:dartz/dartz.dart';
import 'package:flutter_dogs/app/modules/detail_breed/models/breed_image.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_dogs/app/shared/errors/errors.dart';

abstract class IDogsRepository {
  Future<Either<FailureBreed, List<Breed>>> getBreeds();
  Future<Either<FailureBreed, List<BreedImage>>> getBreedImages(Breed breed);
}
