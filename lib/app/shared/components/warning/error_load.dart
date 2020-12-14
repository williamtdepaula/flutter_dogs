import 'package:flutter/material.dart';

class ErrorLoad extends StatelessWidget {
  final Function onReload;

  ErrorLoad({this.onReload});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Algo de errado aconteceu!',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 18.0,
            ),
          ),
          TextButton(
            child: Text('Tentar novamente'),
            onPressed: this.onReload,
          ),
        ],
      ),
    );
  }
}
