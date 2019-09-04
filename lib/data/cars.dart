import 'package:moor_flutter/moor_flutter.dart';

part 'cars.g.dart';

class Cars extends Table {  
  TextColumn get marca => text().withLength(min: 1, max: 30)();
  TextColumn get modelo => text().withLength(min: 1, max: 30)();
}

@UseMoor(tables: [Cars])
class CarDatabase extends _$CarDatabase {
  CarDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite'
  ));
  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Cars])
class CarDao extends DatabaseAccessor<CarDatabase> with _$CarDaoMixin{
  CarDao(CarDatabase db) : super(db);

  Stream<List<Car>> get watchAllCars => select(cars).watch();
  Future insertCar(Insertable<Car> car) => into(cars).insert(car);
}