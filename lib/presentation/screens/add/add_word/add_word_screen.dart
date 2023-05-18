import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prontoictus_flutter/presentation/providers/deck/deck_repository_provider.dart';
import 'package:prontoictus_flutter/presentation/screens/widgets/main_container.dart';

class AddWordScreen extends ConsumerWidget {
  const AddWordScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final response = ref.watch(deckRepositoryProvider);
    // return response.when(
    //     data: (data) => Text('Deck creada'),
    //     error: (err, stack) => Text('error $err'),
    //     loading: () => CircularProgressIndicator());
    return Scaffold(
      body: MainContainer(
          child: response.when(
              data: (data) => Text('Deck creada'),
              error: (err, stack) => Text('error $err'),
              loading: () => Center(child: CircularProgressIndicator()))),
    );
  }
}
