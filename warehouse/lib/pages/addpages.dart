import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:warehouse/model/goods_model.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  final TextEditingController _name = TextEditingController();
  final TextEditingController _description = TextEditingController();

  final Box adTo = Hive.box<Goods>("store_box");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        title: const Text("Склад отдела Сад")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _name,
                decoration: const InputDecoration(
                  hintText: "Наименование",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _description,
                decoration: const InputDecoration(
                  hintText: "В наличии/ в пути/ временно отсутствует", // вбить один вариант из: в наличии, в пути, временно отсутствует
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Colors.deepOrange,
                textColor: Colors.white,
                child: const Text('Добавить'),
                onPressed: () {
                  if (_name.text != '' || _description.text != '') {
                    Goods newItem = Goods(
                      name: _name.text,
                      description: _description.text,
                    );
                    adTo.add(newItem);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text("Готово!"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
