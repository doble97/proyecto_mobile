import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prontoictus_flutter/presentation/providers/deck/deck_repository_provider.dart';

import '../../widgets/main_container.dart';

class AddFriendScreen extends StatelessWidget {
  const AddFriendScreen({super.key});
  static String name = 'Add Friend Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContainer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchGeneric(message: 'Buscar amigos'),
        ),
      ),
    );
  }
}

class SearchGeneric extends ConsumerWidget {
  const SearchGeneric({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context, ref) {
    ref.read(deckRepositoryProvider);
    // print('NOMBRE--->${nombre.deck.name}');
    return TextFormField(
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
          hintText: message,
          prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                color: Colors.amber,
              ))),
    );
  }
}
