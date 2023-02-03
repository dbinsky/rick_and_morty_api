import 'dart:convert';
import 'dart:developer';
import 'package:rick_and_morty_api/core/error/exception.dart';
import 'package:rick_and_morty_api/feature/data/models/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonLocalDataSource {
  Future<List<PersonModel>> getLastPersonsFromCache();
  Future<void> personsToCache(List<PersonModel> persons);
}

const cashedPersonsListKey = 'CASHED_PERSONS_LIST';

class PersonLocalDataSourceImplement implements PersonLocalDataSource {
  final SharedPreferences sharedPreferences;

  PersonLocalDataSourceImplement({required this.sharedPreferences});

  @override
  Future<List<PersonModel>> getLastPersonsFromCache() async {
    final jsonPersonsList =
        sharedPreferences.getStringList(cashedPersonsListKey);
    if (jsonPersonsList != null) {
      return Future.value(jsonPersonsList
          .map((person) => PersonModel.fromJson(json.decode(person)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<String>> personsToCache(List<PersonModel> persons) async {
    final List<String> jsonPersonsList =
        persons.map((person) => json.encode(person.toJson())).toList();

    sharedPreferences.setStringList(cashedPersonsListKey, jsonPersonsList);
    log('Persons to write Cache: ${jsonPersonsList.length}');
    return Future.value(jsonPersonsList);
  }
}
