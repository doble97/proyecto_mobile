import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prontoictus_flutter/presentation/providers/auth/auth_provider.dart';
import 'package:prontoictus_flutter/presentation/screens/widgets/main_container.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});
  static String name = 'Dashboard Screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: MainContainer(child: StatisticsView()),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showBottomSheet(context, ref);
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add_outlined)),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }

  void _showBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 96, 72, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  Icons.crop_portrait_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Añadir baraja',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onTap: () {
                  context.pushReplacement('/add-deck');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.supervised_user_circle_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Añadir amigo',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onTap: () {
                  context.pop();
                  context.push('/add-friend');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Salir',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onTap: () {
                  ref.read(authProvider.notifier).logout();
                },
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        );
      },
    );
  }
}

class StatisticsView extends ConsumerWidget {
  const StatisticsView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);
    return Column(
      children: [
        Text(
          'Información del usuario',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Información del usuario'),
                  ListTile(
                    title: Text('Nombre'),
                    subtitle: Text(state.user!.user.name),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Apellido'),
                    subtitle: Text(state.user!.user.lastName),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text(state.user!.user.email),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Amigos'),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${state.user!.friends}'),
                        Icon(
                          Icons.touch_app_outlined,
                          color: Colors.amber,
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Solicitudes pendientes'),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${state.user!.pendingRequests}'),
                        Icon(
                          Icons.touch_app_outlined,
                          color: Colors.amber,
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
        Card(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text('Tus barajas'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${state.user!.decks}'),
                      Icon(
                        Icons.touch_app_outlined,
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Barajas compartidas'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${state.user!.sharedDecks}'),
                      Icon(
                        Icons.touch_app_outlined,
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {
                    print('inwek imprimiendo');
                  },
                  child: ListTile(
                    title: Text('Barajas seguidas'),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${state.user!.followedDecks}'),
                        Icon(
                          Icons.touch_app_outlined,
                          color: Colors.amber,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
