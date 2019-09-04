// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Car extends DataClass implements Insertable<Car> {
  final String marca;
  final String modelo;
  Car({@required this.marca, @required this.modelo});
  factory Car.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Car(
      marca:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}marca']),
      modelo:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}modelo']),
    );
  }
  factory Car.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Car(
      marca: serializer.fromJson<String>(json['marca']),
      modelo: serializer.fromJson<String>(json['modelo']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'marca': serializer.toJson<String>(marca),
      'modelo': serializer.toJson<String>(modelo),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Car>>(bool nullToAbsent) {
    return CarsCompanion(
      marca:
          marca == null && nullToAbsent ? const Value.absent() : Value(marca),
      modelo:
          modelo == null && nullToAbsent ? const Value.absent() : Value(modelo),
    ) as T;
  }

  Car copyWith({String marca, String modelo}) => Car(
        marca: marca ?? this.marca,
        modelo: modelo ?? this.modelo,
      );
  @override
  String toString() {
    return (StringBuffer('Car(')
          ..write('marca: $marca, ')
          ..write('modelo: $modelo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(marca.hashCode, modelo.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Car && other.marca == marca && other.modelo == modelo);
}

class CarsCompanion extends UpdateCompanion<Car> {
  final Value<String> marca;
  final Value<String> modelo;
  const CarsCompanion({
    this.marca = const Value.absent(),
    this.modelo = const Value.absent(),
  });
  CarsCompanion copyWith({Value<String> marca, Value<String> modelo}) {
    return CarsCompanion(
      marca: marca ?? this.marca,
      modelo: modelo ?? this.modelo,
    );
  }
}

class $CarsTable extends Cars with TableInfo<$CarsTable, Car> {
  final GeneratedDatabase _db;
  final String _alias;
  $CarsTable(this._db, [this._alias]);
  final VerificationMeta _marcaMeta = const VerificationMeta('marca');
  GeneratedTextColumn _marca;
  @override
  GeneratedTextColumn get marca => _marca ??= _constructMarca();
  GeneratedTextColumn _constructMarca() {
    return GeneratedTextColumn('marca', $tableName, false,
        minTextLength: 1, maxTextLength: 30);
  }

  final VerificationMeta _modeloMeta = const VerificationMeta('modelo');
  GeneratedTextColumn _modelo;
  @override
  GeneratedTextColumn get modelo => _modelo ??= _constructModelo();
  GeneratedTextColumn _constructModelo() {
    return GeneratedTextColumn('modelo', $tableName, false,
        minTextLength: 1, maxTextLength: 30);
  }

  @override
  List<GeneratedColumn> get $columns => [marca, modelo];
  @override
  $CarsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cars';
  @override
  final String actualTableName = 'cars';
  @override
  VerificationContext validateIntegrity(CarsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.marca.present) {
      context.handle(
          _marcaMeta, marca.isAcceptableValue(d.marca.value, _marcaMeta));
    } else if (marca.isRequired && isInserting) {
      context.missing(_marcaMeta);
    }
    if (d.modelo.present) {
      context.handle(
          _modeloMeta, modelo.isAcceptableValue(d.modelo.value, _modeloMeta));
    } else if (modelo.isRequired && isInserting) {
      context.missing(_modeloMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Car map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Car.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CarsCompanion d) {
    final map = <String, Variable>{};
    if (d.marca.present) {
      map['marca'] = Variable<String, StringType>(d.marca.value);
    }
    if (d.modelo.present) {
      map['modelo'] = Variable<String, StringType>(d.modelo.value);
    }
    return map;
  }

  @override
  $CarsTable createAlias(String alias) {
    return $CarsTable(_db, alias);
  }
}

abstract class _$CarDatabase extends GeneratedDatabase {
  _$CarDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $CarsTable _cars;
  $CarsTable get cars => _cars ??= $CarsTable(this);
  CarDao _carDao;
  CarDao get carDao => _carDao ??= CarDao(this as CarDatabase);
  @override
  List<TableInfo> get allTables => [cars];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$CarDaoMixin on DatabaseAccessor<CarDatabase> {
  $CarsTable get cars => db.cars;
}
