import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dogs/app/modules/detail_breed/models/breed_image.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_dogs/app/shared/errors/errors.dart';
import 'package:flutter_dogs/app/shared/infra/datasource/dogs_datasource_interface.dart';
import 'dogs_repository_interface.dart';

class DogsRepository implements IDogsRepository {
  IDogsDataSource dogsDataSource;

  DogsRepository({this.dogsDataSource});

  @override
  Future<Either<FailureBreed, List<Breed>>> getBreeds() async {
    try {
      Response response = await dogsDataSource.getBreeds();

      String status = response.data['status'];

      if (status == 'success') {
        final message = response.data['message'];

        List<Breed> breeds = [];

        message.entries
            .forEach((value) => breeds.add(Breed(breedName: value.key)));

        return Right(breeds);
      } else {
        return Left(BreedError());
      }
    } catch (e) {
      return Left(BreedError());
    }
  }

  @override
  Future<Either<FailureBreed, List<BreedImage>>> getBreedImages(
    Breed breed,
  ) async {
    if (breed != null) {
      try {
        Response response =
            await dogsDataSource.getBreedImages(breed.breedName);

        String status = response.data['status'];

        if (status == 'success') {
          final message = response.data['message'];

          List<BreedImage> breedImages = [];

          message.forEach(
              (value) => breedImages.add(BreedImage(urlPicture: value)));

          return Right(breedImages);
        }
      } catch (e) {
        print("aqui123");
        return Left(BreedImagesError());
      }
    }

    return Left(IncompletDataError());
  }
}
