// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkoutModelCollection on Isar {
  IsarCollection<WorkoutModel> get workoutModels => this.collection();
}

const WorkoutModelSchema = CollectionSchema(
  name: r'WorkoutModel',
  id: -3690729546837745423,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'workoutExercises': PropertySchema(
      id: 1,
      name: r'workoutExercises',
      type: IsarType.objectList,
      target: r'WorkoutExerciseModel',
    )
  },
  estimateSize: _workoutModelEstimateSize,
  serialize: _workoutModelSerialize,
  deserialize: _workoutModelDeserialize,
  deserializeProp: _workoutModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'WorkoutExerciseModel': WorkoutExerciseModelSchema},
  getId: _workoutModelGetId,
  getLinks: _workoutModelGetLinks,
  attach: _workoutModelAttach,
  version: '3.1.0+1',
);

int _workoutModelEstimateSize(
  WorkoutModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.workoutExercises.length * 3;
  {
    final offsets = allOffsets[WorkoutExerciseModel]!;
    for (var i = 0; i < object.workoutExercises.length; i++) {
      final value = object.workoutExercises[i];
      bytesCount +=
          WorkoutExerciseModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _workoutModelSerialize(
  WorkoutModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeObjectList<WorkoutExerciseModel>(
    offsets[1],
    allOffsets,
    WorkoutExerciseModelSchema.serialize,
    object.workoutExercises,
  );
}

WorkoutModel _workoutModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkoutModel();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  return object;
}

P _workoutModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectList<WorkoutExerciseModel>(
            offset,
            WorkoutExerciseModelSchema.deserialize,
            allOffsets,
            WorkoutExerciseModel(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workoutModelGetId(WorkoutModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workoutModelGetLinks(WorkoutModel object) {
  return [];
}

void _workoutModelAttach(
    IsarCollection<dynamic> col, Id id, WorkoutModel object) {
  object.id = id;
}

extension WorkoutModelQueryWhereSort
    on QueryBuilder<WorkoutModel, WorkoutModel, QWhere> {
  QueryBuilder<WorkoutModel, WorkoutModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkoutModelQueryWhere
    on QueryBuilder<WorkoutModel, WorkoutModel, QWhereClause> {
  QueryBuilder<WorkoutModel, WorkoutModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WorkoutModelQueryFilter
    on QueryBuilder<WorkoutModel, WorkoutModel, QFilterCondition> {
  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      workoutExercisesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workoutExercises',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      workoutExercisesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workoutExercises',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      workoutExercisesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workoutExercises',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      workoutExercisesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workoutExercises',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      workoutExercisesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workoutExercises',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      workoutExercisesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workoutExercises',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension WorkoutModelQueryObject
    on QueryBuilder<WorkoutModel, WorkoutModel, QFilterCondition> {
  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      workoutExercisesElement(FilterQuery<WorkoutExerciseModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'workoutExercises');
    });
  }
}

extension WorkoutModelQueryLinks
    on QueryBuilder<WorkoutModel, WorkoutModel, QFilterCondition> {}

extension WorkoutModelQuerySortBy
    on QueryBuilder<WorkoutModel, WorkoutModel, QSortBy> {
  QueryBuilder<WorkoutModel, WorkoutModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension WorkoutModelQuerySortThenBy
    on QueryBuilder<WorkoutModel, WorkoutModel, QSortThenBy> {
  QueryBuilder<WorkoutModel, WorkoutModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension WorkoutModelQueryWhereDistinct
    on QueryBuilder<WorkoutModel, WorkoutModel, QDistinct> {
  QueryBuilder<WorkoutModel, WorkoutModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension WorkoutModelQueryProperty
    on QueryBuilder<WorkoutModel, WorkoutModel, QQueryProperty> {
  QueryBuilder<WorkoutModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkoutModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<WorkoutModel, List<WorkoutExerciseModel>, QQueryOperations>
      workoutExercisesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workoutExercises');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WorkoutExerciseModelSchema = Schema(
  name: r'WorkoutExerciseModel',
  id: 7225851704036738303,
  properties: {
    r'exerciseId': PropertySchema(
      id: 0,
      name: r'exerciseId',
      type: IsarType.long,
    ),
    r'reps': PropertySchema(
      id: 1,
      name: r'reps',
      type: IsarType.long,
    ),
    r'restTime': PropertySchema(
      id: 2,
      name: r'restTime',
      type: IsarType.long,
    ),
    r'sets': PropertySchema(
      id: 3,
      name: r'sets',
      type: IsarType.long,
    )
  },
  estimateSize: _workoutExerciseModelEstimateSize,
  serialize: _workoutExerciseModelSerialize,
  deserialize: _workoutExerciseModelDeserialize,
  deserializeProp: _workoutExerciseModelDeserializeProp,
);

int _workoutExerciseModelEstimateSize(
  WorkoutExerciseModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _workoutExerciseModelSerialize(
  WorkoutExerciseModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.exerciseId);
  writer.writeLong(offsets[1], object.reps);
  writer.writeLong(offsets[2], object.restTime);
  writer.writeLong(offsets[3], object.sets);
}

WorkoutExerciseModel _workoutExerciseModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkoutExerciseModel();
  object.exerciseId = reader.readLongOrNull(offsets[0]);
  object.reps = reader.readLongOrNull(offsets[1]);
  object.restTime = reader.readLongOrNull(offsets[2]);
  object.sets = reader.readLongOrNull(offsets[3]);
  return object;
}

P _workoutExerciseModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension WorkoutExerciseModelQueryFilter on QueryBuilder<WorkoutExerciseModel,
    WorkoutExerciseModel, QFilterCondition> {
  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> exerciseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exerciseId',
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> exerciseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exerciseId',
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> exerciseIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> exerciseIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> exerciseIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> exerciseIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> repsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reps',
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> repsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reps',
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> repsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> repsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> repsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> repsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> restTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'restTime',
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> restTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'restTime',
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> restTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> restTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'restTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> restTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'restTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> restTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'restTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> setsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sets',
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> setsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sets',
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> setsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> setsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> setsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExerciseModel, WorkoutExerciseModel,
      QAfterFilterCondition> setsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WorkoutExerciseModelQueryObject on QueryBuilder<WorkoutExerciseModel,
    WorkoutExerciseModel, QFilterCondition> {}
