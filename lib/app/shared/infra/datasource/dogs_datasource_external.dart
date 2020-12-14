import 'package:dio/dio.dart';
import 'package:flutter_dogs/app/shared/infra/datasource/dogs_datasource_interface.dart';

class DogsDataSource implements IDogsDataSource {
  Dio dio;

  DogsDataSource({this.dio});

  @override
  Future getBreeds() async {
    Response res = await dio.get('/breeds/list/all');

    return res;
  }

  @override
  Future getBreedImages(String breedName) async {
    Response res = await dio.get('/breed/$breedName/images/random/10');

    return res;
  }
}
