import 'package:rick_and_morty_api/core/error/exception.dart';
import 'package:rick_and_morty_api/core/platform/network_info.dart';
import 'package:rick_and_morty_api/feature/data/datasources/person_local_data_source.dart';
import 'package:rick_and_morty_api/feature/data/datasources/person_remote_data_source.dart';
import 'package:rick_and_morty_api/feature/data/models/person_model.dart';
import 'package:rick_and_morty_api/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty_api/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_api/feature/domain/repositories/person_repository.dart';

class PersonRepositoryImplements implements PersonRepository {
  final PersonRemoteDataSource remoteDataSource;
  final PersonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PersonRepositoryImplements({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPerson(int page) async {
    return await _getPersons(() => remoteDataSource.getAllPersons(page));
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query) async {
    return await _getPersons(() => remoteDataSource.searchPerson(query));
  }

  Future<Either<Failure, List<PersonModel>>> _getPersons(
      Future<List<PersonModel>> Function() getPersons) async {
    if (await networkInfo.icConnected) {
      try {
        final remotePerson = await getPersons();
        localDataSource.personsToCache(remotePerson);
        return Right(remotePerson);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPerson = await localDataSource.getLastPersonsFromCache();
        return Right(localPerson);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
