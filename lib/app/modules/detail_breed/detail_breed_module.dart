import 'package:flutter_dogs/app/shared/infra/repositories/dogs_repository_interface.dart';

import 'detail_breed_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'detail_breed_page.dart';

class DetailBreedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<DetailBreedController>(
          (i) =>
              DetailBreedController(dogsRepository: i.get<IDogsRepository>()),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => DetailBreedPage(
            breed: args.data,
          ),
        ),
      ];

  static Inject get to => Inject<DetailBreedModule>.of();
}
