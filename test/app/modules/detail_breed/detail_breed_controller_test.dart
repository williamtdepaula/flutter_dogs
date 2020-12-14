import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dogs/app/modules/detail_breed/detail_breed_controller.dart';
import 'package:flutter_dogs/app/modules/detail_breed/detail_breed_module.dart';
import 'package:flutter_dogs/app/modules/detail_breed/models/breed_image.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_dogs/app/shared/infra/datasource/dogs_datasource_interface.dart';
import 'package:flutter_dogs/app/shared/infra/repositories/dogs_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DogsDataSourceMock extends Mock implements IDogsDataSource {}

main() {
  DogsDataSourceMock dogsDataSourceMock = new DogsDataSourceMock();

  DogsRepository dogsRepository =
      new DogsRepository(dogsDataSource: dogsDataSourceMock);

  initModule(
    DetailBreedModule(),
    changeBinds: [
      Bind<DetailBreedController>(
        (i) => DetailBreedController(dogsRepository: dogsRepository),
      ),
    ],
  );

  DetailBreedController detailBreedController =
      Modular.get<DetailBreedController>();

  detailBreedController.setBreedSelected(Breed(breedName: 'test'));

  test(
    'Adicionar as raças no array de raças quando a controller carregar',
    () async {
      when(dogsDataSourceMock.getBreedImages(any)).thenAnswer(
        (_) async => Response(
          data: jsonDecode('{"message": ["link"], "status": "success"}'),
        ),
      );

      await detailBreedController.loadListBreedImages();

      expect(detailBreedController.breedImages.isNotEmpty, true);
      expect(detailBreedController.error == null, true);
    },
  );

  test(
    'Adicionar as raças da nova página no fim do array de raças quando chamar uma outra página',
    () async {
      when(dogsDataSourceMock.getBreedImages(any)).thenAnswer(
        (_) async => Response(
          data: jsonDecode('{"message": ["link2"], "status": "success"}'),
        ),
      );

      //Adiciona um item na página 0
      detailBreedController.setBreedImages([BreedImage(urlPicture: 'link1')]);

      //Esperamos a página já tem um item na página um
      expect(detailBreedController.breedImages.length == 1, true);

      //Adiciona um item na página 1
      await detailBreedController.loadListBreedImages();

      //Esperamos a página já tem um item na página dois e que não haja erro
      expect(detailBreedController.breedImages.length == 2, true);
      expect(detailBreedController.error == null, true);
    },
  );
  test(
    'Adicionar erro a variável error, quando retorna a API retornar algum erro',
    () async {
      when(dogsDataSourceMock.getBreedImages(any)).thenAnswer(
        (_) async => Exception(),
      );

      await detailBreedController.loadListBreedImages();

      expect(detailBreedController.error != null, true);
    },
  );
}
