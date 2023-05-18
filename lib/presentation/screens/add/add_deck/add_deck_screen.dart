import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prontoictus_flutter/domain/entity/deck.dart';
import 'package:prontoictus_flutter/presentation/providers/auth/auth_provider.dart';
import 'package:prontoictus_flutter/presentation/providers/deck/deck_repository_provider.dart';
import 'package:prontoictus_flutter/presentation/screens/widgets/main_container.dart';

class AddDeckScreen extends ConsumerStatefulWidget {
  const AddDeckScreen({super.key});
  static String name = 'Add Deck Screen';

  @override
  AddDeckScreenState createState() => AddDeckScreenState();
}

class AddDeckScreenState extends ConsumerState<AddDeckScreen> {
  String? _selectedValue = "Spanish";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContainer(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  labelText: 'Añadir baraja',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            ///////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Idioma de la baraja '),
                DropdownButton<String>(
                  value: _selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue!;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  items: <String>[
                    'English',
                    'Spanish',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  // final state = ref.read(authProvider);
                  // try{
                  //   await
                  // }catch(err){

                  // }
                  // ref.read(deckRepositoryProvider).create(
                  //     userId: state.user!.user.id,
                  //     resource: Deck(name: 'mobile', language: 1));
                  ref.read(deckStateProvider.notifier).state =
                      DeckState(Deck(name: 'Pruebas flutter', language: 1));
                  context.push('/add-word');
                },
                child: Text('Crear baraja'))
          ],
        )),
      )),
    );
  }
}
