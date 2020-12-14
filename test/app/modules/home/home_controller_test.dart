import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dogs/app/shared/infra/datasource/dogs_datasource_interface.dart';
import 'package:flutter_dogs/app/shared/infra/repositories/dogs_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_dogs/app/modules/home/home_controller.dart';
import 'package:flutter_dogs/app/modules/home/home_module.dart';
import 'package:mockito/mockito.dart';

class DogsDataSourceMock extends Mock implements IDogsDataSource {}

void main() {
  DogsDataSourceMock dogsDataSourceMock = new DogsDataSourceMock();
  DogsRepository dogsRepository =
      new DogsRepository(dogsDataSource: dogsDataSourceMock);

  initModule(HomeModule(), changeBinds: [
    Bind<HomeController>((i) => HomeController(dogsRepository: dogsRepository))
  ]);

  HomeController homeController = Modular.get<HomeController>();

  test('Carregar lista de raças', () async {
    when(dogsDataSourceMock.getBreeds()).thenAnswer(
      (_) async => Response(
        data: jsonDecode('{"message": {"poodle": []}, "status": "success"}'),
        statusCode: 200,
      ),
    );

    await homeController.loadBreeds();

    expect(homeController.breeds.length > 0, true);
    expect(homeController.warning == null, true);
  });

  test("Trazer uma lista com a raça digitada", () async {
    homeController.setFilter('poodle');

    expect(homeController.filteredList.length == 1, true);
    expect(homeController.filteredList[0].breedName == 'poodle', true);
  });
  test(
      "Retornar uma lista vázia quando digitar uma raça que não existe na lista",
      () async {
    homeController.setFilter('raça inexistente');

    expect(homeController.filteredList.length == 0, true);
  });

  test('Alterar a variável warning, por que a repository retornou algum erro',
      () async {
    when(dogsDataSourceMock.getBreeds()).thenAnswer((_) async => Exception());

    await homeController.loadBreeds();

    expect(homeController.breeds.length == 0, true);
    expect(homeController.warning != null, true);
  });
}
