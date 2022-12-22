import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:warehouse/model/goods_model.dart';
import 'package:warehouse/pages/homepage.dart';
import 'package:warehouse/ui/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  
  Hive.registerAdapter(GoodsAdapter());
 
  await Hive.openBox<Goods>("store_box");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: CustomTheme.lightTheme,
      home: HomePage(),
    );
  }
}