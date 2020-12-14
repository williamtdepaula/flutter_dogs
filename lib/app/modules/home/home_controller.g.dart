// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(dogsRepository: i<DogsRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<List<Breed>> _$filteredListComputed;

  @override
  List<Breed> get filteredList => (_$filteredListComputed ??=
          Computed<List<Breed>>(() => super.filteredList,
              name: '_HomeControllerBase.filteredList'))
      .value;

  final _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

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

  final _$warningAtom = Atom(name: '_HomeControllerBase.warning');

  @override
  FailureBreed get warning {
    _$warningAtom.reportRead();
    return super.warning;
  }

  @override
  set warning(FailureBreed value) {
    _$warningAtom.reportWrite(value, super.warning, () {
      super.warning = value;
    });
  }

  final _$breedsAtom = Atom(name: '_HomeControllerBase.breeds');

  @override
  ObservableList<Breed> get breeds {
    _$breedsAtom.reportRead();
    return super.breeds;
  }

  @override
  set breeds(ObservableList<Breed> value) {
    _$breedsAtom.reportWrite(value, super.breeds, () {
      super.breeds = value;
    });
  }

  final _$filterAtom = Atom(name: '_HomeControllerBase.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$loadBreedsAsyncAction = AsyncAction('_HomeControllerBase.loadBreeds');

  @override
  Future<dynamic> loadBreeds() {
    return _$loadBreedsAsyncAction.run(() => super.loadBreeds());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setFilter(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic openBreed(Breed breed) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.openBreed');
    try {
      return super.openBreed(breed);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
warning: ${warning},
breeds: ${breeds},
filter: ${filter},
filteredList: ${filteredList}
    ''';
  }
}
