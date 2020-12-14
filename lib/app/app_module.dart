import 'package:dio/dio.dart';
import 'package:flutter_dogs/app/modules/detail_breed/detail_breed_module.dart';
import 'package:flutter_dogs/app/modules/detail_breed/detail_breed_page.dart';
import 'package:flutter_dogs/app/shared/infra/datasource/dogs_datasource_external.dart';
import 'package:flutter_dogs/app/shared/infra/repositories/dogs_repository.dart';
import 'package:flutter_dogs/app/shared/utils/constants.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dogs/app/app_widget.dart';
import 'package:flutter_dogs/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => Dio(BaseOptions(baseUrl: BASE_URL)),
        ),
        Bind(
          (i) =>
              DogsRepository(dogsDataSource: DogsDataSource(dio: i.get<Dio>())),
        )
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter(
          '/detail_breed',
          module: DetailBreedModule(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
