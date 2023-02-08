import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_api/feature/domain/entities/person_entity.dart';

abstract class PersonListState extends Equatable {
  const PersonListState();

  @override
  List<Object?> get props => [];
}

class PersonListEmptyState extends PersonListState {
  @override
  List<Object?> get props => [];
}

class PersonListLoadingState extends PersonListState {
  final List<PersonEntity> oldPersonsList;
  final bool isFirstFetch;

  const PersonListLoadingState(
      {required this.oldPersonsList, required this.isFirstFetch});
}
