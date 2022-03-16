import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kuis/Info.dart';

import 'app_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('IF PlayStore'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final AppStore store = appList[index];
          return Card(
              child: Row(
            children: [
              Container(
                child: Image.network(
                  store.imageLogo,
                  width: 100,
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Text(store.name),
                  ),
                  Container(
                    child: Text(store.genre),
                  )
                ],
              ),
            ],
          ));
        },
        itemCount: appList.length,
      ),
    ));
  }
}
