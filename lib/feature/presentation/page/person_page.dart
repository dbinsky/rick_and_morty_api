import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/feature/presentation/widgets/persons_list_widget.dart';
import 'package:rick_and_morty_api/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).main_app_bar_title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: PersonsListWidget(),
    );
  }
}
