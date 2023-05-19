import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prontoictus_flutter/domain/entity/user_in.dart';
import 'package:prontoictus_flutter/presentation/providers/auth/auth_provider.dart';
import 'package:prontoictus_flutter/presentation/providers/deck/deck_repository_provider.dart';
import 'package:prontoictus_flutter/presentation/screens/widgets/main_container.dart';

import '../../../../domain/entity/deck.dart';

class AddWordScreen extends ConsumerWidget {
  const AddWordScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final response = ref.watch(deckRepositoryProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: MainContainer(
            child: response.when(
                data: (data) {
                  // ref.read(authProvider.notifier).updateResources();
                  return DataDeck(
                    deck: data,
                  );
                },
                error: (err, stack) {
                  return Center(
                    child: ListTile(
                      title: Text(
                        'Error de creación',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w900),
                      ),
                      subtitle: Text(
                        'Ha habido un error al intentar crear la baraja, asegurese que tiene internet',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
                loading: () => const LoadingDeck())),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushReplacement('/dashboard');
          },
          child: Icon(Icons.keyboard_return_outlined)),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}

class DataDeck extends StatelessWidget {
  const DataDeck({
    super.key,
    required this.deck,
  });
  final Deck deck;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            title: Text(
              deck.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
            ),
            subtitle: Text(
              'Añade contenedio a tu baraja',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Palabra'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Traducción'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Guardar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('Salir')))
                    ],
                  )
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}

class LoadingDeck extends StatelessWidget {
  const LoadingDeck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Creando baraja',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 32,
        ),
        CircularProgressIndicator(),
      ],
    ));
  }
}
