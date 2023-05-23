import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prontoictus_flutter/presentation/screens/widgets/main_container.dart';

import '../../../helpers/validators.dart';
import '../../providers/auth/auth_provider.dart';
import '../widgets/generic_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContainer(child: _FormView()),
    );
  }
}

class _FormView extends ConsumerStatefulWidget {
  const _FormView();

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends ConsumerState<_FormView> {
  var email = "";
  var password = "";
  var name = "";
  var lastName = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Registrate',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
            ),
            GenericTextField(
                suffixIcon: Icons.person_2,
                onValue: (String? value) {
                  name = value ?? "";
                },
                labelText: 'Nombre',
                valitorCallback: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Escribe tu nombre";
                  }
                  return null;
                }),
            GenericTextField(
                suffixIcon: Icons.person_4,
                onValue: (String? value) {
                  lastName = value ?? "";
                },
                labelText: 'Apellido',
                valitorCallback: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Escribe tu apellido";
                  }
                  return null;
                }),
            GenericTextField(
              labelText: 'Email',
              onValue: (value) {
                email = value ?? "";
              },
              suffixIcon: Icons.email_outlined,
              valitorCallback: Validator.emailValidator,
            ),
            GenericTextField(
              labelText: 'Password',
              onValue: (value) {
                password = value ?? "";
              },
              suffixIcon: Icons.password_outlined,
              isPassword: true,
              valitorCallback: Validator.passwordValidator,
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
                    await ref.read(authProvider.notifier).register(
                        email: email,
                        password: password,
                        name: name,
                        lastName: lastName);
                  }
                  // context.go('/dashboard');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Registrarse'),
                )),
            GestureDetector(
              onTap: () {
                context.pushReplacement('/login');
              },
              child: Text(
                'Ya tengo cuenta',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
