import 'package:dartz/dartz.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_dogs/app/shared/errors/errors.dart';
import 'package:flutter_dogs/app/shared/infra/repositories/dogs_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  DogsRepository dogsRepository;

  _HomeControllerBase({this.dogsRepository}) {
    this.loadBreeds();
  }

  @observable
  bool loading = true;

  @observable
  FailureBreed warning;

  @observable
  ObservableList<Breed> breeds = <Breed>[].asObservable();

  @observable
  String filter = '';

  @computed
  List<Breed> get filteredList {
    if (filter.isEmpty) return breeds;
    return breeds
        .where((Breed breed) =>
            breed.breedName.contains(this.filter.toLowerCase()))
        .toList();
  }

  @action
  void setFilter(String value) => this.filter = value;

  @action
  void setLoading(bool value) => this.loading = value;

  @action
  Future loadBreeds() async {
    this.loading = true;

    Either<FailureBreed, List<Breed>> responseBreeds =
        await dogsRepository.getBreeds();

    if (responseBreeds.isRight()) {
      warning = null;
      breeds = responseBreeds.getOrElse(() => null).asObservable();
    } else {
      warning = responseBreeds.fold(id, null);
      breeds = [].asObservable();
    }

    this.loading = false;
  }

  @action
  openBreed(Breed breed) {
    Modular.to.pushNamed('/detail_breed', arguments: breed);
  }
}
