import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  String nameDeck = "";
  int idLanguage = 1;
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContainer(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  controller: textController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Inserta un nombre para tu baraja';
                    }
                    nameDeck = value;
                    return null;
                  },
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
                        idLanguage = newValue == 'Spanish' ? 1 : 2;
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
                      if (_formKey.currentState!.validate()) {
                        ref.read(deckStateProvider.notifier).state =
                            DeckState(language: idLanguage, name: nameDeck);
                        // textController.clear();
                        context.pushReplacement('/add-word');
                      }
                    },
                    child: Text('Crear baraja'))
              ],
            )),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushReplacement('/dashboard');
          },
          child: Icon(Icons.keyboard_return_outlined)),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}
