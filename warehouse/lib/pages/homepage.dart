import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:warehouse/model/goods_model.dart';
import 'package:warehouse/pages/addpages.dart';
import 'package:warehouse/utils/usable_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final Box box = Hive.box<Goods>("store_box");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Склад отдела Сад")),
          
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pushRoute(context, widget: AddPage());
          },
          child: const Icon(Icons.add),
        ),
        body: ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (context, Box box, widget) {
              if (box.isEmpty) {
                return const Center(child: Text('Добавить первую позицию'));
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      Goods goods = box.getAt(index);
                      return ListTile(
                        title: Text(
                          goods.name,
                        ),
                        subtitle: Text(goods.description),
                        trailing: IconButton(
                          onPressed: () {
                            box.deleteAt(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 5),
                                content: Text("Товар удален"),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.blueGrey,
                          ),
                        ),
                      );
                    });
              }
            })));}}