import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api/core/error/failure.dart';
import 'package:rick_and_morty_api/feature/domain/usecases/search_person.dart';
import 'package:rick_and_morty_api/feature/presentation/bloc/search_bloc/search_event.dart';
import 'package:rick_and_morty_api/feature/presentation/bloc/search_bloc/search_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;

  PersonSearchBloc({required this.searchPerson})
      : super(PersonSearchEmptyState()) {
    on<PersonSearchBeginEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
      PersonSearchBeginEvent event, Emitter<PersonSearchState> emit) async {
    emit(PersonSearchLoadingState());
    final failureOrPerson =
        await searchPerson(SearchPersonParams(query: event.personQuery));
    emit(failureOrPerson.fold(
        (failure) =>
            PersonSearchErrorState(message: _mapFailureToMessage(failure)),
        (person) => PersonSearchLoadedState(persons: person)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
