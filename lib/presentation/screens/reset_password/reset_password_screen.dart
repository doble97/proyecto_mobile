import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prontoictus_flutter/helpers/validators.dart';

import '../widgets/generic_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  static String name = 'Reset Password Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          bottom: false,
          child: SingleChildScrollView(
              child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/login/LoginBackground_03.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: _FormView(),
          ))),
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
              child: Image.asset('assets/images/shared/OONWATCHLogo.png')),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: GenericTextField(
                      labelText: 'Email',
                      onValue: (value) {},
                      suffixIcon: Icons.email_outlined,
                      valitorCallback: Validator.emailValidator,
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
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Iniciar'),
                      )),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Text(
                      'Volver a inicio de sesión',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(child: Image.asset('assets/images/shared/IOONLogo.png')),
        ],
      ),
    );
  }
}
