import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prontoictus_flutter/domain/entity/user_in.dart';
import 'package:prontoictus_flutter/helpers/validators.dart';
import 'package:prontoictus_flutter/infrastructure/datasources/auth_datasource_imp.dart';
import 'package:prontoictus_flutter/infrastructure/repositories/auth_repository_imp.dart';

import '../widgets/generic_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String name = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  // Theme.of(context).colorScheme.secondary,
                  // Theme.of(context).colorScheme.primary
                  Colors.brown, Colors.amber
                ], begin: Alignment.bottomCenter, end: Alignment.bottomCenter)),
                child: _FormView(),
              ),
            )));
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
  var email = "";
  var password = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: GenericTextField(
              labelText: 'Email',
              onValue: (value) {
                email = value ?? "";
              },
              suffixIcon: Icons.email_outlined,
              valitorCallback: Validator.emailValidator,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: GenericTextField(
              labelText: 'Password',
              onValue: (value) {
                password = value ?? "";
              },
              suffixIcon: Icons.password_outlined,
              isPassword: true,
              valitorCallback: Validator.passwordValidator,
            ),
          ),
          FilledButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
              onPressed: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  //TDO: implementar llamada a la api rest o algo por el estilo
                  // context.go('/dashboard');
                  _formKey.currentState!.save();
                  print('ES VALIDO');
                  llamada(email, password);
                }
                // context.go('/dashboard');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Iniciar'),
              )),
          GestureDetector(
            onTap: () {
              context.push('/reset-password');
            },
            child: Text(
              '¿Olvidó la contraseña?',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> llamada(String email, String password) async {
    final repositorio = AuthRepositoryImp(AuthDatasourceImpl());
    final UserIn user = await repositorio.login(email, password);
    print('usuario ${user.token.token}');
    context.go('/dashboard');
  }
}

































///////////////////////////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:prontoictus_flutter/helpers/validators.dart';

// import '../widgets/generic_text_field.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//   static String name = 'LoginScreen';

//   @override
//   Widget build(BuildContext context) {
//     // final double topPadding = MediaQuery.of(context).padding.top;
//     return Scaffold(
//       body: SafeArea(
//         top: false,
//         bottom: false,
//         child: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/images/login/LoginBackground_02.png"),
//                 fit: BoxFit.fill,
//               ),
//             ),
//             child: _FormView(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _FormView extends StatefulWidget {
//   const _FormView({
//     super.key,
//   });

//   @override
//   State<_FormView> createState() => _FormViewState();
// }

// class _FormViewState extends State<_FormView> {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           Image.asset('assets/images/login/LoginBackground_03.png'),
//           const SizedBox(
//             height: 100,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32),
//             child: GenericTextField(
//               labelText: 'Email',
//               onValue: (value) {},
//               suffixIcon: Icons.email_outlined,
//               valitorCallback: Validator.emailValidator,
//             ),
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32),
//             child: GenericTextField(
//               labelText: 'Password',
//               onValue: (value) {},
//               suffixIcon: Icons.password_outlined,
//               isPassword: true,
//               valitorCallback: Validator.passwordValidator,
//             ),
//           ),
//           const SizedBox(
//             height: 32,
//           ),
//           FilledButton(
//               style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               )),
//               onPressed: () {
//                 if (_formKey.currentState != null &&
//                     _formKey.currentState!.validate()) {
//                   //TDO: implementar llamada a la api rest o algo por el estilo
//                   context.go('/dashboard');
//                 }
//                 context.go('/dashboard');
//               },
//               child: const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Text('Iniciar'),
//               )),
//           const SizedBox(
//             height: 16,
//           ),
//           GestureDetector(
//             onTap: () {
//               context.push('/reset-password');
//             },
//             child: Text(
//               '¿Olvidó la contraseña?',
//               style: TextStyle(
//                 color: Theme.of(context).primaryColor,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
