// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_breed_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetailBreedController = BindInject(
  (i) => DetailBreedController(dogsRepository: i<IDogsRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailBreedController on _DetailBreedControllerBase, Store {
  final _$loadingAtom = Atom(name: '_DetailBreedControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$breedImagesAtom =
      Atom(name: '_DetailBreedControllerBase.breedImages');

  @override
  ObservableList<BreedImage> get breedImages {
    _$breedImagesAtom.reportRead();
    return super.breedImages;
  }

  @override
  set breedImages(ObservableList<BreedImage> value) {
    _$breedImagesAtom.reportWrite(value, super.breedImages, () {
      super.breedImages = value;
    });
  }

  final _$errorAtom = Atom(name: '_DetailBreedControllerBase.error');

  @override
  FailureBreed get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(FailureBreed value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadListBreedImagesAsyncAction =
      AsyncAction('_DetailBreedControllerBase.loadListBreedImages');

  @override
  Future<void> loadListBreedImages({bool reset = false}) {
    return _$loadListBreedImagesAsyncAction
        .run(() => super.loadListBreedImages(reset: reset));
  }

  final _$_DetailBreedControllerBaseActionController =
      ActionController(name: '_DetailBreedControllerBase');

  @override
  dynamic setBreedImages(List<BreedImage> value) {
    final _$actionInfo = _$_DetailBreedControllerBaseActionController
        .startAction(name: '_DetailBreedControllerBase.setBreedImages');
    try {
      return super.setBreedImages(value);
    } finally {
      _$_DetailBreedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
breedImages: ${breedImages},
error: ${error}
    ''';
  }
}
