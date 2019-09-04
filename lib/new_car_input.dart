import 'package:flutter/material.dart';
import 'package:moor_example/data/cars.dart';
import 'package:provider/provider.dart';

class NewCarInput extends StatefulWidget {
  const NewCarInput({Key key}) : super(key: key);

  _NewCarInputState createState() => _NewCarInputState();
}

class _NewCarInputState extends State<NewCarInput> {
  TextEditingController controller1;
  TextEditingController controller2;
  String marca;
  String modelo;

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    modelo = '';
    marca = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          _buildTextField1(context),
          _buildTextField2(context),
        ],
      ),
    );
  }

  _buildTextField2(BuildContext context) {
      return Flexible(
          flex: 1,
          child: TextField(
            controller: controller2,
          decoration: InputDecoration(hintText: 'Modelo'),
          onSubmitted: (inputName) {
            final dao = Provider.of<CarDao>(context);
            final car = Car(
              marca: marca,
              modelo: inputName
            );
            dao.insertCar(car);
            resetValuesAfterSubmit();
          },
        ),
      );
  }

  _buildTextField1(BuildContext context) {
    return Flexible(
          flex: 1,
          child: TextField(
            controller: controller1,
          decoration: InputDecoration(hintText: 'Marca'),
          onSubmitted: (inputName) {
            marca = inputName;
          },
        ),
      );
  }

  void resetValuesAfterSubmit() {
    setState(() {
      marca = '';
      modelo = '';
      controller1.clear();
      controller2.clear();
    });
  }
}