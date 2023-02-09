import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api/core/error/failure.dart';
import 'package:rick_and_morty_api/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty_api/feature/domain/usecases/get_all_persons.dart';
import 'package:rick_and_morty_api/feature/presentation/bloc/person_list_cubit/person_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PersonListCubit extends Cubit<PersonListState> {
  final GetAllPersons getAllPersons;
  PersonListCubit({required this.getAllPersons})
      : super(PersonListEmptyState());

  int page = 1;

  void loadPerson() async {
    if (state is PersonListLoadingState) return;

    final currentState = state;

    var oldPerson = <PersonEntity>[];
    if (currentState is PersonListLoadedState) {
      oldPerson = currentState.personsList;
    }

    emit(PersonListLoadingState(oldPerson, isFirstFetch: page == 1));

    final failureOrPerson = await getAllPersons(PagePersonParams(page: page));

    failureOrPerson.fold(
        (error) => PersonListErrorState(message: _mapFailureToMessage(error)),
        (character) {
      page++;
      final persons = (state as PersonListLoadingState).oldPersonsList;
      persons.addAll(character);
      emit(PersonListLoadedState(persons));
    });
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
