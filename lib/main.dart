import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:rick_and_morty_api/feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty_api/feature/presentation/page/person_page.dart';
import 'package:rick_and_morty_api/locator_servise.dart' as di;
import 'locator_servise.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonListCubit>(
            create: (context) => sl<PersonListCubit>()),
        BlocProvider<PersonSearchBloc>(
            create: (context) => sl<PersonSearchBloc>()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(background: Colors.black),
          scaffoldBackgroundColor: Colors.grey,
        ),
        home: const HomePage(),
      ),
    );
  }
}
