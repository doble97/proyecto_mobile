import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prontoictus_flutter/presentation/providers/deck/deck_all_provider.dart';
import 'package:prontoictus_flutter/presentation/screens/widgets/main_container.dart';

class DeckScreen extends ConsumerWidget {
  const DeckScreen({super.key});
  static String name = "Deck Screen";
  @override
  Widget build(BuildContext context, ref) {
    final response = ref.watch(deckAllProvider);
    return Scaffold(
      body: MainContainer(
          child: response.when(
              data: (data) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          data[index].name,
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: Text('Ver')),
                            ElevatedButton(
                                onPressed: () {}, child: Text('Eliminar'))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: ((context, index) {
                      return Divider();
                    }),
                    itemCount: data.length);
              },
              error: (err, tracke) {
                return Text('error');
              },
              loading: () => LoadingGeneric(message: 'Cargando tus barajas'))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushReplacement('/dashboard');
        },
        child: Icon(Icons.home_filled),
      ),
    );
  }
}

class LoadingGeneric extends StatelessWidget {
  const LoadingGeneric({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          this.message,
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
