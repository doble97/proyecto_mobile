import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prontoictus_flutter/helpers/validators.dart';
import 'package:prontoictus_flutter/presentation/providers/auth/auth_provider.dart';

import '../widgets/generic_text_field.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  static String name = 'LoginScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authProvider, (previos, next) {
      print('El objeto está cambiando');
      if (next.userStatus == UserStatus.notAuthenticated) {
        showErrorMessage(context);
      }
    });
    return Scaffold(
        body: SafeArea(
            top: false,
            bottom: false,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                ], begin: Alignment.bottomCenter, end: Alignment.bottomCenter)),
                child: _FormView(),
              ),
            )));
  }

  void showErrorMessage(BuildContext ctx) {
    print('errro en la autenticacion');
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(
      'Ha ocurrido un error',
      textAlign: TextAlign.center,
    )));
  }
}

class _FormView extends ConsumerStatefulWidget {
  const _FormView({
    super.key,
  });

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends ConsumerState<_FormView> {
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
              onPressed: () async {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  //TDO: implementar llamada a la api rest o algo por el estilo
                  // context.go('/dashboard');
                  _formKey.currentState!.save();
                  print('ES VALIDO');
                  await ref
                      .read(authProvider.notifier)
                      .login(email: email, password: password);
                }
                // context.go('/dashboard');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Iniciar'),
              )),
          GestureDetector(
            onTap: () {
              context.pushReplacement('/register');
            },
            child: Text(
              '¿No tienes cuenta?',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
