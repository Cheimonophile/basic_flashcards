// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_db.dart';

// ignore_for_file: type=lint
class Deck extends Table with TableInfo<Deck, DeckData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Deck(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'deck';
  @override
  VerificationContext validateIntegrity(Insertable<DeckData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeckData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeckData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  Deck createAlias(String alias) {
    return Deck(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DeckData extends DataClass implements Insertable<DeckData> {
  final int id;
  final String name;
  const DeckData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  DeckCompanion toCompanion(bool nullToAbsent) {
    return DeckCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory DeckData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeckData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  DeckData copyWith({int? id, String? name}) => DeckData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('DeckData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeckData && other.id == this.id && other.name == this.name);
}

class DeckCompanion extends UpdateCompanion<DeckData> {
  final Value<int> id;
  final Value<String> name;
  const DeckCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  DeckCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<DeckData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  DeckCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return DeckCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeckCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class Card extends Table with TableInfo<Card, CardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Card(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _deckIdMeta = const VerificationMeta('deckId');
  late final GeneratedColumn<int> deckId = GeneratedColumn<int>(
      'deck_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _frontMeta = const VerificationMeta('front');
  late final GeneratedColumn<String> front = GeneratedColumn<String>(
      'front', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _backMeta = const VerificationMeta('back');
  late final GeneratedColumn<String> back = GeneratedColumn<String>(
      'back', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
      'score', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, deckId, front, back, score];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'card';
  @override
  VerificationContext validateIntegrity(Insertable<CardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('deck_id')) {
      context.handle(_deckIdMeta,
          deckId.isAcceptableOrUnknown(data['deck_id']!, _deckIdMeta));
    } else if (isInserting) {
      context.missing(_deckIdMeta);
    }
    if (data.containsKey('front')) {
      context.handle(
          _frontMeta, front.isAcceptableOrUnknown(data['front']!, _frontMeta));
    } else if (isInserting) {
      context.missing(_frontMeta);
    }
    if (data.containsKey('back')) {
      context.handle(
          _backMeta, back.isAcceptableOrUnknown(data['back']!, _backMeta));
    } else if (isInserting) {
      context.missing(_backMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      deckId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}deck_id'])!,
      front: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}front'])!,
      back: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}back'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}score'])!,
    );
  }

  @override
  Card createAlias(String alias) {
    return Card(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['FOREIGN KEY(deck_id)REFERENCES deck(id)'];
  @override
  bool get dontWriteConstraints => true;
}

class CardData extends DataClass implements Insertable<CardData> {
  final int id;
  final int deckId;
  final String front;
  final String back;
  final double score;
  const CardData(
      {required this.id,
      required this.deckId,
      required this.front,
      required this.back,
      required this.score});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['deck_id'] = Variable<int>(deckId);
    map['front'] = Variable<String>(front);
    map['back'] = Variable<String>(back);
    map['score'] = Variable<double>(score);
    return map;
  }

  CardCompanion toCompanion(bool nullToAbsent) {
    return CardCompanion(
      id: Value(id),
      deckId: Value(deckId),
      front: Value(front),
      back: Value(back),
      score: Value(score),
    );
  }

  factory CardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardData(
      id: serializer.fromJson<int>(json['id']),
      deckId: serializer.fromJson<int>(json['deck_id']),
      front: serializer.fromJson<String>(json['front']),
      back: serializer.fromJson<String>(json['back']),
      score: serializer.fromJson<double>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deck_id': serializer.toJson<int>(deckId),
      'front': serializer.toJson<String>(front),
      'back': serializer.toJson<String>(back),
      'score': serializer.toJson<double>(score),
    };
  }

  CardData copyWith(
          {int? id, int? deckId, String? front, String? back, double? score}) =>
      CardData(
        id: id ?? this.id,
        deckId: deckId ?? this.deckId,
        front: front ?? this.front,
        back: back ?? this.back,
        score: score ?? this.score,
      );
  @override
  String toString() {
    return (StringBuffer('CardData(')
          ..write('id: $id, ')
          ..write('deckId: $deckId, ')
          ..write('front: $front, ')
          ..write('back: $back, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, deckId, front, back, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardData &&
          other.id == this.id &&
          other.deckId == this.deckId &&
          other.front == this.front &&
          other.back == this.back &&
          other.score == this.score);
}

class CardCompanion extends UpdateCompanion<CardData> {
  final Value<int> id;
  final Value<int> deckId;
  final Value<String> front;
  final Value<String> back;
  final Value<double> score;
  const CardCompanion({
    this.id = const Value.absent(),
    this.deckId = const Value.absent(),
    this.front = const Value.absent(),
    this.back = const Value.absent(),
    this.score = const Value.absent(),
  });
  CardCompanion.insert({
    this.id = const Value.absent(),
    required int deckId,
    required String front,
    required String back,
    required double score,
  })  : deckId = Value(deckId),
        front = Value(front),
        back = Value(back),
        score = Value(score);
  static Insertable<CardData> custom({
    Expression<int>? id,
    Expression<int>? deckId,
    Expression<String>? front,
    Expression<String>? back,
    Expression<double>? score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deckId != null) 'deck_id': deckId,
      if (front != null) 'front': front,
      if (back != null) 'back': back,
      if (score != null) 'score': score,
    });
  }

  CardCompanion copyWith(
      {Value<int>? id,
      Value<int>? deckId,
      Value<String>? front,
      Value<String>? back,
      Value<double>? score}) {
    return CardCompanion(
      id: id ?? this.id,
      deckId: deckId ?? this.deckId,
      front: front ?? this.front,
      back: back ?? this.back,
      score: score ?? this.score,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deckId.present) {
      map['deck_id'] = Variable<int>(deckId.value);
    }
    if (front.present) {
      map['front'] = Variable<String>(front.value);
    }
    if (back.present) {
      map['back'] = Variable<String>(back.value);
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardCompanion(')
          ..write('id: $id, ')
          ..write('deckId: $deckId, ')
          ..write('front: $front, ')
          ..write('back: $back, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }
}

abstract class _$CollectionDb extends GeneratedDatabase {
  _$CollectionDb(QueryExecutor e) : super(e);
  _$CollectionDbManager get managers => _$CollectionDbManager(this);
  late final Deck deck = Deck(this);
  late final Card card = Card(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [deck, card];
}

typedef $DeckInsertCompanionBuilder = DeckCompanion Function({
  Value<int> id,
  required String name,
});
typedef $DeckUpdateCompanionBuilder = DeckCompanion Function({
  Value<int> id,
  Value<String> name,
});

class $DeckTableManager extends RootTableManager<
    _$CollectionDb,
    Deck,
    DeckData,
    $DeckFilterComposer,
    $DeckOrderingComposer,
    $DeckProcessedTableManager,
    $DeckInsertCompanionBuilder,
    $DeckUpdateCompanionBuilder> {
  $DeckTableManager(_$CollectionDb db, Deck table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $DeckFilterComposer(ComposerState(db, table)),
          orderingComposer: $DeckOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $DeckProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              DeckCompanion(
            id: id,
            name: name,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              DeckCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $DeckProcessedTableManager extends ProcessedTableManager<
    _$CollectionDb,
    Deck,
    DeckData,
    $DeckFilterComposer,
    $DeckOrderingComposer,
    $DeckProcessedTableManager,
    $DeckInsertCompanionBuilder,
    $DeckUpdateCompanionBuilder> {
  $DeckProcessedTableManager(super.$state);
}

class $DeckFilterComposer extends FilterComposer<_$CollectionDb, Deck> {
  $DeckFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $DeckOrderingComposer extends OrderingComposer<_$CollectionDb, Deck> {
  $DeckOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $CardInsertCompanionBuilder = CardCompanion Function({
  Value<int> id,
  required int deckId,
  required String front,
  required String back,
  required double score,
});
typedef $CardUpdateCompanionBuilder = CardCompanion Function({
  Value<int> id,
  Value<int> deckId,
  Value<String> front,
  Value<String> back,
  Value<double> score,
});

class $CardTableManager extends RootTableManager<
    _$CollectionDb,
    Card,
    CardData,
    $CardFilterComposer,
    $CardOrderingComposer,
    $CardProcessedTableManager,
    $CardInsertCompanionBuilder,
    $CardUpdateCompanionBuilder> {
  $CardTableManager(_$CollectionDb db, Card table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $CardFilterComposer(ComposerState(db, table)),
          orderingComposer: $CardOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $CardProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> deckId = const Value.absent(),
            Value<String> front = const Value.absent(),
            Value<String> back = const Value.absent(),
            Value<double> score = const Value.absent(),
          }) =>
              CardCompanion(
            id: id,
            deckId: deckId,
            front: front,
            back: back,
            score: score,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int deckId,
            required String front,
            required String back,
            required double score,
          }) =>
              CardCompanion.insert(
            id: id,
            deckId: deckId,
            front: front,
            back: back,
            score: score,
          ),
        ));
}

class $CardProcessedTableManager extends ProcessedTableManager<
    _$CollectionDb,
    Card,
    CardData,
    $CardFilterComposer,
    $CardOrderingComposer,
    $CardProcessedTableManager,
    $CardInsertCompanionBuilder,
    $CardUpdateCompanionBuilder> {
  $CardProcessedTableManager(super.$state);
}

class $CardFilterComposer extends FilterComposer<_$CollectionDb, Card> {
  $CardFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get deckId => $state.composableBuilder(
      column: $state.table.deckId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get front => $state.composableBuilder(
      column: $state.table.front,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get back => $state.composableBuilder(
      column: $state.table.back,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get score => $state.composableBuilder(
      column: $state.table.score,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $CardOrderingComposer extends OrderingComposer<_$CollectionDb, Card> {
  $CardOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get deckId => $state.composableBuilder(
      column: $state.table.deckId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get front => $state.composableBuilder(
      column: $state.table.front,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get back => $state.composableBuilder(
      column: $state.table.back,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get score => $state.composableBuilder(
      column: $state.table.score,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$CollectionDbManager {
  final _$CollectionDb _db;
  _$CollectionDbManager(this._db);
  $DeckTableManager get deck => $DeckTableManager(_db, _db.deck);
  $CardTableManager get card => $CardTableManager(_db, _db.card);
}
