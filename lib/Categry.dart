import 'package:flutter/material.dart';

class Categry extends StatelessWidget {
  final String category;
  final int isexplore;
  const Categry(this.category, this.isexplore);

  @override
  Widget build(BuildContext context) {
    if (isexplore == 1) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [Icon(Icons.explore), Text(category)],
          ),
        ),
      );
    } else {
      return Container(
        height: 30,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Text(category),
              ),
            )),
      );
    }
  }
}
