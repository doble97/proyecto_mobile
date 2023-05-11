import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prontoictus_flutter/helpers/validators.dart';
import 'package:prontoictus_flutter/presentation/screens/screens.dart';
import 'package:prontoictus_flutter/presentation/screens/widgets/generic_text_field.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static String name = 'Dashboard Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          bottom: false,
          child: SingleChildScrollView(
              child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              // Theme.of(context).colorScheme.secondary,
              // Theme.of(context).colorScheme.primary
              Colors.yellow, Colors.amber
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: _FormView(),
          ))),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.settings)),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
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
                  Icons.watch_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Añadir baraja',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.bluetooth_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Añadir amigo',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onTap: () {
                  context.pop();
                  context.push('/reset-password');
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
                  context.go('/');
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

class _FormView extends StatefulWidget {
  const _FormView({
    super.key,
  });

  @override
  State<_FormView> createState() => _FormViewState();
}

class _FormViewState extends State<_FormView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Código Ictus'))
                ],
              )),
        ],
      ),
    );
  }
}














































  //////////////////////////////////
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           padding: EdgeInsets.zero,
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/dashboard/FondoHome.png'),
//                   fit: BoxFit.fill)),
//           child: Center(
//             child: Container(
//               color: Colors.amber,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Image.asset('assets/images/shared/IOONLogo.png'),
//                   ElevatedButton(onPressed: () {}, child: Text('bOTON')),
//                   ElevatedButton(onPressed: () {}, child: Text('bOTON')),
//                   ElevatedButton(onPressed: () {}, child: Text('bOTON')),
//                   ElevatedButton(onPressed: () {}, child: Text('bOTON')),
//                   SizedBox(height: 20),
//                   Image.asset('assets/images/shared/IOONLogo.png'),
//                 ],
//               ),
//             ),
//           )),
//       // floatingActionButton: FloatingActionButton(
//       //   // onPressed: () {},
//       //   child: Icon(
//       //     Icons.settings,
//       //     color: Theme.of(context).primaryColor,
//       //   ),
//       //   tooltip: 'Settings',
//       //   backgroundColor: Colors.transparent,
//       //   foregroundColor: Colors.white,
//       //   shape: RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.circular(10.0),
//       //   ),
//       //   isExtended: true,
//       //   heroTag: null,
//       //   // Agregar el siguiente código para mostrar un menú
//       //   onPressed: () {
//       //     showModalBottomSheet(
//       //       context: context,
//       //       builder: (BuildContext context) {
//       //         return Container(
//       //           height: 200.0,
//       //           child: Center(
//       //             child: Text('Menú'),
//       //           ),
//       //         );
//       //       },
//       //     );
//       //   },
//       // ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(Icons.settings),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
//     );
//   }
// }

// class _PopMenu extends StatelessWidget {
//   const _PopMenu({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       itemBuilder: (BuildContext context) {
//         return <PopupMenuEntry<String>>[
//           PopupMenuItem<String>(
//             value: 'option1',
//             child: const Text('Option 1'),
//           ),
//           const PopupMenuDivider(),
//           PopupMenuItem<String>(
//             value: 'option2',
//             child: const Text('Option 2'),
//           ),
//           PopupMenuItem<String>(
//             value: 'option3',
//             child: const Text('Option 3'),
//           ),
//         ];
//       },
//       onSelected: (String result) {
//         // Do something with the selected option
//       },
//       icon: Icon(Icons.more_vert),
//     );
//   }
// }









