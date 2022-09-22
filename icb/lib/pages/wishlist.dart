import 'package:flutter/material.dart';
import 'package:icb/new_widget/listview.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: PopItemList(),
      ),
    );
  }
}
