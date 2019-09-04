import 'package:flutter/material.dart';
import 'package:moor_example/data/cars.dart';
import 'package:moor_example/new_car_input.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cars'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildTaskList(context)),
            NewCarInput()
          ],
        ));
  }
}

StreamBuilder<List<Car>> _buildTaskList(BuildContext context) {
    final dao = Provider.of<CarDao>(context);
    return StreamBuilder(
      stream: dao.watchAllCars,
      builder: (context, AsyncSnapshot<List<Car>> snapshot) {
        final cars = snapshot.data ?? List();

        return ListView.builder(
          itemCount: cars.length,
          itemBuilder: (_, index) {
            final item = cars[index];
            return _buildListItem(item, dao);
          },
        );
      },
    );
  }

  Widget _buildListItem(Car item, CarDao dao) {
    return ListTile(
      title: Text('${item.marca} ${item.modelo}')
    );
  }

