import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prontoictus_flutter/infrastructure/datasources/friends/search_datasource_impl.dart';
import 'package:prontoictus_flutter/presentation/providers/friend/friend_provider.dart';

import '../../widgets/main_container.dart';

class AddFriendScreen extends ConsumerWidget {
  const AddFriendScreen({super.key});
  static String name = 'Add Friend Screen';

  @override
  Widget build(BuildContext context, ref) {
    final _state = ref.watch(friendState);
    return Scaffold(
      body: MainContainer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchGeneric(message: 'Buscar amigo'),
              _state.email.isEmpty
                  ? Text('Aquí aparecerá el usuario que buscas')
                  : FutureBuilder(
                      future: SearchDatasourceImpl().searchFriend(_state.email),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          print('Data ${snapshot.data!.lastName}');
                          return Center(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    '${snapshot.data!.name} ${snapshot.data!.lastName}',
                                    textAlign: TextAlign.center,
                                  ),
                                  subtitle: Text(
                                    '${snapshot.data!.email}',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Enviar solicitud'))
                              ],
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Text('No se ha encontrado ningun usuario');
                        }
                        return LoadingFriend();
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

// ref.read(friendRepositoryProvider).when(data: (data) {
//                       return Text('data');
//                     }, error: (err, stacktrace) {
//                       return Text('Error');
//                     }, loading: () {
//                       print('LOAFING ');
//                       return Center(
//                         child: LoadingFriend(),
//                       );
//                     })

class SearchGeneric extends ConsumerStatefulWidget {
  SearchGeneric({super.key, required this.message});
  final String message;

  @override
  _SearchGenericState createState() => _SearchGenericState();
}

class _SearchGenericState extends ConsumerState<SearchGeneric> {
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String email = "";
    return Form(
      key: _form,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Introduce un correo electronico';
          }
          email = value;
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
            hintText: widget.message,
            prefixIcon: IconButton(
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    ref.read(friendState.notifier).state =
                        FriendState(email: email);
                  }
                },
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.amber,
                ))),
      ),
    );
  }
}

class LoadingFriend extends StatelessWidget {
  const LoadingFriend({
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
