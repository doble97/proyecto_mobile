import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String name = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login/LoginBackground_02.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              SizedBox(
                height: 280,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: GenericTextField(
                  labelText: 'Email',
                  onValue: (value) {},
                  suffixIcon: Icons.email_outlined,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: GenericTextField(
                  labelText: 'Pasword',
                  onValue: (value) {},
                  suffixIcon: Icons.password_outlined,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              FilledButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Iniciar'),
                  )),
              SizedBox(
                height: 16,
              ),
              Text('¿Olvidó contraseña?')
            ],
          )),
        ),
      ),
    );
  }
}

class GenericTextField extends StatelessWidget {
  final ValueChanged<String> onValue;
  final IconData? suffixIcon;
  final String labelText;
  final bool isPassword;
  const GenericTextField(
      {super.key,
      required this.onValue,
      this.suffixIcon,
      required this.labelText,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    return TextFormField(
        obscureText: isPassword,
        focusNode: focusNode,
        decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
            enabledBorder: _OutlineInputBorder().getDecoration(context),
            focusedBorder: _OutlineInputBorder().getDecoration(context)),
        onTapOutside: (event) {
          focusNode.unfocus();
        });
  }
}

class _OutlineInputBorder {
  OutlineInputBorder getDecoration(BuildContext ctx) {
    return OutlineInputBorder(
        borderSide: BorderSide(width: 3, color: Theme.of(ctx).primaryColor));
  }
}
