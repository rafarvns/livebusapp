// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDatabaseBean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _UserBean implements Bean<User> {
  final id = IntField('id');
  final latitude = DoubleField('latitude');
  final longitude = DoubleField('longitude');
  final markerId = StrField('marker_id');
  final title = StrField('title');
  final snippets = StrField('snippets');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        latitude.name: latitude,
        longitude.name: longitude,
        markerId.name: markerId,
        title.name: title,
        snippets.name: snippets,
      };
  User fromMap(Map map) {
    User model = User();
    model.id = adapter.parseValue(map['id']);
    model.latitude = adapter.parseValue(map['latitude']);
    model.longitude = adapter.parseValue(map['longitude']);
    model.markerId = adapter.parseValue(map['marker_id']);
    model.title = adapter.parseValue(map['title']);
    model.snippets = adapter.parseValue(map['snippets']);

    return model;
  }

  List<SetColumn> toSetColumns(User model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(latitude.set(model.latitude));
      ret.add(longitude.set(model.longitude));
      ret.add(markerId.set(model.markerId));
      ret.add(title.set(model.title));
      ret.add(snippets.set(model.snippets));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(latitude.name)) ret.add(latitude.set(model.latitude));
      if (only.contains(longitude.name))
        ret.add(longitude.set(model.longitude));
      if (only.contains(markerId.name)) ret.add(markerId.set(model.markerId));
      if (only.contains(title.name)) ret.add(title.set(model.title));
      if (only.contains(snippets.name)) ret.add(snippets.set(model.snippets));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.latitude != null) {
        ret.add(latitude.set(model.latitude));
      }
      if (model.longitude != null) {
        ret.add(longitude.set(model.longitude));
      }
      if (model.markerId != null) {
        ret.add(markerId.set(model.markerId));
      }
      if (model.title != null) {
        ret.add(title.set(model.title));
      }
      if (model.snippets != null) {
        ret.add(snippets.set(model.snippets));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, isNullable: false);
    st.addDouble(latitude.name, isNullable: false);
    st.addDouble(longitude.name, isNullable: false);
    st.addStr(markerId.name, isNullable: false);
    st.addStr(title.name, isNullable: false);
    st.addStr(snippets.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(User model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      User newModel;
      if (model.lines != null) {
        newModel ??= await find(model.id);
        model.lines.forEach((x) => lineBean.associateUser(x, newModel));
        for (final child in model.lines) {
          await lineBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<User> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(insert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = models
          .map((model) =>
              toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
          .toList();
      final InsertMany insert = inserters.addAll(data);
      await adapter.insertMany(insert);
      return;
    }
  }

  Future<dynamic> upsert(User model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      User newModel;
      if (model.lines != null) {
        newModel ??= await find(model.id);
        model.lines.forEach((x) => lineBean.associateUser(x, newModel));
        for (final child in model.lines) {
          await lineBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<User> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(upsert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = [];
      for (var i = 0; i < models.length; ++i) {
        var model = models[i];
        data.add(
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      }
      final UpsertMany upsert = upserters.addAll(data);
      await adapter.upsertMany(upsert);
      return;
    }
  }

  Future<int> update(User model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      User newModel;
      if (model.lines != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.lines.forEach((x) => lineBean.associateUser(x, newModel));
        }
        for (final child in model.lines) {
          await lineBean.update(child, cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<User> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(update(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = [];
      final List<Expression> where = [];
      for (var i = 0; i < models.length; ++i) {
        var model = models[i];
        data.add(
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
        where.add(this.id.eq(model.id));
      }
      final UpdateMany update = updaters.addAll(data, where);
      await adapter.updateMany(update);
      return;
    }
  }

  Future<User> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final User model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(int id, {bool cascade = false}) async {
    if (cascade) {
      final User newModel = await find(id);
      if (newModel != null) {
        await lineBean.removeByUser(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<User> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<User> preload(User model, {bool cascade = false}) async {
    model.lines =
        await lineBean.findByUser(model.id, preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<User>> preloadAll(List<User> models,
      {bool cascade = false}) async {
    models.forEach((User model) => model.lines ??= []);
    await OneToXHelper.preloadAll<User, Line>(
        models,
        (User model) => [model.id],
        lineBean.findByUserList,
        (Line model) => [model.userId],
        (User model, Line child) =>
            model.lines = List.from(model.lines)..add(child),
        cascade: cascade);
    return models;
  }

  LineBean get lineBean;
}
