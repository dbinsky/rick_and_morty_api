import 'dart:convert';
import 'dart:developer';
import 'package:rick_and_morty_api/core/error/exception.dart';
import 'package:rick_and_morty_api/feature/data/models/person_model.dart';
import 'package:http/http.dart' as http;

abstract class PersonRemoteDataSource {
  Future<List<PersonModel>> getAllPersons(int page);
  Future<List<PersonModel>> searchPerson(String query);
}

class PersonRemoteDataSourceImplement implements PersonRemoteDataSource {
  final http.Client client;

  PersonRemoteDataSourceImplement({required this.client});
  @override
  Future<List<PersonModel>> getAllPersons(int page) => _getPersonFromUrl(
      'https://rickandmortyapi.com/api/character/?page=$page');

  @override
  Future<List<PersonModel>> searchPerson(String query) => _getPersonFromUrl(
      'https://rickandmortyapi.com/api/character/?name=rick$query');

  Future<List<PersonModel>> _getPersonFromUrl(String url) async {
    log(url);
    final response = await client.get(
      Uri.parse(url),
      headers: {'Content type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final persons = json.decode(response.body);
      return (persons['results'] as List)
          .map((person) => PersonModel.fromJson(person))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
