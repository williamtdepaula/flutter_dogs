import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dogs/app/modules/detail_breed/models/breed_image.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_dogs/app/shared/errors/errors.dart';
import 'package:flutter_dogs/app/shared/infra/repositories/dogs_repository_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detail_breed_controller.g.dart';

@Injectable()
class DetailBreedController = _DetailBreedControllerBase
    with _$DetailBreedController;

abstract class _DetailBreedControllerBase with Store {
  IDogsRepository dogsRepository;

  Breed _breedSelected;

  ScrollController scrollController = new ScrollController();

  _DetailBreedControllerBase({this.dogsRepository});

  void setBreedSelected(Breed breedSelected) =>
      this._breedSelected = breedSelected;

  @observable
  bool loading = false;

  @observable
  ObservableList<BreedImage> breedImages = <BreedImage>[].asObservable();

  @observable
  FailureBreed error;

  @action
  setBreedImages(List<BreedImage> value) =>
      this.breedImages = value.asObservable();

  @action
  Future<void> loadListBreedImages({bool reset = false}) async {
    if (!loading) {
      loading = true;

      Either<FailureBreed, List<BreedImage>> breedImagesResponse =
          await dogsRepository.getBreedImages(_breedSelected);

      if (breedImagesResponse.isRight()) {
        List<BreedImage> allBreedImages =
            breedImagesResponse.getOrElse(() => null);

        if (reset) {
          breedImages.addAll(allBreedImages.asObservable());
        } else {
          breedImages.addAll(allBreedImages.asObservable());
        }

        error = null;
      } else {
        error = breedImagesResponse.fold(id, null);
      }

      loading = false;
    }
  }
}
