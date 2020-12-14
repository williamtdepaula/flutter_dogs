import 'package:flutter/material.dart';
import 'package:flutter_dogs/app/modules/home/components/item_list/item_list_breed.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_dogs/app/shared/components/warning/error_load.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Buscar uma raça',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          onChanged: controller.setFilter,
        ),
        centerTitle: false,
      ),
      body: _handlerRenderBody(),
    );
  }

  Widget _handlerRenderBody() {
    return SafeArea(
      child: Observer(
        builder: (_) {
          return controller.warning != null
              ? ErrorLoad(
                  onReload: controller.loadBreeds,
                )
              : controller.loading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller.filteredList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Breed breed = controller.filteredList[index];

                        return ItemListBreed(
                          breed: breed,
                        );
                      },
                    );
        },
      ),
    );
  }
}
