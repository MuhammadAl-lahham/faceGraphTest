// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Chair extends DataClass implements Insertable<Chair> {
  final int id;
  final String title;
  final String? picture;
  final String? description;
  final DateTime date;
  final bool status;
  Chair(
      {required this.id,
      required this.title,
      this.picture,
      this.description,
      required this.date,
      required this.status});
  factory Chair.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Chair(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      picture: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}picture']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      status: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || picture != null) {
      map['picture'] = Variable<String?>(picture);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    map['date'] = Variable<DateTime>(date);
    map['status'] = Variable<bool>(status);
    return map;
  }

  ChairsCompanion toCompanion(bool nullToAbsent) {
    return ChairsCompanion(
      id: Value(id),
      title: Value(title),
      picture: picture == null && nullToAbsent
          ? const Value.absent()
          : Value(picture),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      date: Value(date),
      status: Value(status),
    );
  }

  factory Chair.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Chair(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      picture: serializer.fromJson<String?>(json['picture']),
      description: serializer.fromJson<String?>(json['description']),
      date: serializer.fromJson<DateTime>(json['date']),
      status: serializer.fromJson<bool>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'picture': serializer.toJson<String?>(picture),
      'description': serializer.toJson<String?>(description),
      'date': serializer.toJson<DateTime>(date),
      'status': serializer.toJson<bool>(status),
    };
  }

  Chair copyWith(
          {int? id,
          String? title,
          String? picture,
          String? description,
          DateTime? date,
          bool? status}) =>
      Chair(
        id: id ?? this.id,
        title: title ?? this.title,
        picture: picture ?? this.picture,
        description: description ?? this.description,
        date: date ?? this.date,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('Chair(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('picture: $picture, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, picture, description, date, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chair &&
          other.id == this.id &&
          other.title == this.title &&
          other.picture == this.picture &&
          other.description == this.description &&
          other.date == this.date &&
          other.status == this.status);
}

class ChairsCompanion extends UpdateCompanion<Chair> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> picture;
  final Value<String?> description;
  final Value<DateTime> date;
  final Value<bool> status;
  const ChairsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.picture = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.status = const Value.absent(),
  });
  ChairsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.picture = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.status = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Chair> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String?>? picture,
    Expression<String?>? description,
    Expression<DateTime>? date,
    Expression<bool>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (picture != null) 'picture': picture,
      if (description != null) 'description': description,
      if (date != null) 'date': date,
      if (status != null) 'status': status,
    });
  }

  ChairsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? picture,
      Value<String?>? description,
      Value<DateTime>? date,
      Value<bool>? status}) {
    return ChairsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      picture: picture ?? this.picture,
      description: description ?? this.description,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (picture.present) {
      map['picture'] = Variable<String?>(picture.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (status.present) {
      map['status'] = Variable<bool>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChairsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('picture: $picture, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $ChairsTable extends Chairs with TableInfo<$ChairsTable, Chair> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ChairsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 30),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _pictureMeta = const VerificationMeta('picture');
  @override
  late final GeneratedColumn<String?> picture = GeneratedColumn<String?>(
      'picture', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<bool?> status = GeneratedColumn<bool?>(
      'status', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (status IN (0, 1))',
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, picture, description, date, status];
  @override
  String get aliasedName => _alias ?? 'chairs';
  @override
  String get actualTableName => 'chairs';
  @override
  VerificationContext validateIntegrity(Insertable<Chair> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('picture')) {
      context.handle(_pictureMeta,
          picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chair map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Chair.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChairsTable createAlias(String alias) {
    return $ChairsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ChairsTable chairs = $ChairsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [chairs];
}
