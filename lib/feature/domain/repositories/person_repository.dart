import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_api/core/error/failure.dart';
import 'package:rick_and_morty_api/feature/domain/entities/person_entity.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPerson(int page);
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query);
}
