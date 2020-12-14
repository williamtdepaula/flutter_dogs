import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dogs/app/app_module.dart';
import 'package:flutter_dogs/app/modules/detail_breed/models/breed_image.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_dogs/app/shared/errors/errors.dart';
import 'package:flutter_dogs/app/shared/infra/datasource/dogs_datasource_interface.dart';
import 'package:flutter_dogs/app/shared/infra/repositories/dogs_repository.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DogsDataSourceMock extends Mock implements IDogsDataSource {}

main() {
  DogsDataSourceMock dogsDataSourceMock = new DogsDataSourceMock();
  DogsRepository dogsRepository =
      new DogsRepository(dogsDataSource: dogsDataSourceMock);

  group('API de raças', () {
    test('Buscar raças', () async {
      when(dogsDataSourceMock.getBreeds()).thenAnswer(
        (_) async => Response(
          data: jsonDecode('{"message": {}, "status": "success"}'),
          statusCode: 200,
        ),
      );

      final result = await dogsRepository.getBreeds();

      expect(result | null, isA<List<Breed>>());
    });

    test('API falhou ao buscar raças', () async {
      when(dogsDataSourceMock.getBreeds()).thenThrow((_) async => Exception());

      final result = await dogsRepository.getBreeds();

      expect(result.fold(id, id), isA<BreedError>());
    });
  });

  group('API de imagens das raças', () {
    Breed breed = Breed(breedName: 'pinscher');
    test('Buscar imagens de uma raça em específica', () async {
      when(dogsDataSourceMock.getBreedImages(any)).thenAnswer(
        (_) async => Response(
          data: jsonDecode('{"message": [], "status": "success"}'),
          statusCode: 200,
        ),
      );

      final result = await dogsRepository.getBreedImages(breed);

      expect(result.fold(id, id), isA<List<BreedImage>>());
    });

    test('Buscar imagens de uma raça em específica sem passar a raça',
        () async {
      final result = await dogsRepository.getBreedImages(null);

      expect(result.fold(id, id), isA<IncompletDataError>());
    });

    test('A API falhou ao buscar imagens da raça', () async {
      when(dogsDataSourceMock.getBreedImages(any))
          .thenAnswer((realInvocation) async => Response(statusCode: 400));

      final result = await dogsRepository.getBreedImages(breed);

      expect(result.fold(id, id), isA<BreedImagesError>());
    });
  });
}
