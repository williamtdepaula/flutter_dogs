import 'package:flutter/material.dart';
import 'package:flutter_dogs/app/modules/detail_breed/components/loading/loading.dart';

class LoadMore extends StatelessWidget {
  final bool loading;
  final Function onReload;

  LoadMore({this.loading, this.onReload});

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Center(
            child: TextButton(
              child: Text('Carregar mais'),
              onPressed: onReload,
            ),
          );
  }
}
