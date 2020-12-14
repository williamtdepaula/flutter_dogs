import 'package:flutter/material.dart';
import 'package:flutter_dogs/app/modules/detail_breed/components/item_list/item_list_breed_image.dart';
import 'package:flutter_dogs/app/modules/detail_breed/components/load_more/load_more.dart';
import 'package:flutter_dogs/app/modules/detail_breed/components/loading/loading.dart';
import 'package:flutter_dogs/app/modules/detail_breed/detail_breed_controller.dart';
import 'package:flutter_dogs/app/modules/home/models/breed.dart';
import 'package:flutter_dogs/app/shared/components/warning/error_load.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailBreedPage extends StatefulWidget {
  final Breed breed;

  const DetailBreedPage({this.breed});

  @override
  _DetailBreedPageState createState() => _DetailBreedPageState();
}

class _DetailBreedPageState
    extends ModularState<DetailBreedPage, DetailBreedController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();

    controller.setBreedSelected(widget.breed);

    controller.loadListBreedImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.breed.breedName),
      ),
      body: _handlerRenderBody(),
    );
  }

  Widget _handlerRenderBody() {
    return SafeArea(
      child: Observer(
        builder: (_) {
          return (controller.breedImages.length == 0 && controller.loading)
              ? Loading()
              : RefreshIndicator(
                  onRefresh: () => controller.loadListBreedImages(reset: true),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          controller: controller.scrollController,
                          itemCount: controller.breedImages.length,
                          itemBuilder: (context, index) {
                            return ItemListBreedImage(
                              breedImage: controller.breedImages[index],
                            );
                          },
                        ),
                        controller.error == null
                            ? LoadMore(
                                loading: controller.loading,
                                onReload: controller.loadListBreedImages,
                              )
                            : Container(),
                        controller.error != null
                            ? ErrorLoad(
                                onReload: controller.loadListBreedImages,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
