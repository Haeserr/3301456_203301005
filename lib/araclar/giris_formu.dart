import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doktor_app/araclar/sabitler.dart';

class GirisFormu extends StatefulWidget {
  const GirisFormu({super.key});

  @override
  State<GirisFormu> createState() => _GirisFormuState();
}

class _GirisFormuState extends State<GirisFormu> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _sifreController = TextEditingController();

  String _email = '';
  String _sifre = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Sabitler.primaryColor,
            decoration: InputDecoration(
              hintText: 'Email Adresi',
              labelText: 'Email',
              alignLabelWithHint: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Sabitler.primaryColor),
                borderRadius: BorderRadius.circular(30),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  )),
              prefixIcon: const Icon(Icons.email_outlined),
              prefixIconColor: Sabitler.primaryColor,
            ),
            validator: (value) => !(EmailValidator.validate(value!))
                ? 'Geçerli mail adresi giriniz'
                : null,
            onSaved: (newValue) {
              _email = newValue!;
            },
          ),
          Sabitler.spaceSmall,
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _sifreController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Sabitler.primaryColor,
            decoration: InputDecoration(
              hintText: 'Şifre',
              labelText: 'Şifre',
              alignLabelWithHint: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Sabitler.primaryColor),
                borderRadius: BorderRadius.circular(30),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  )),
              prefixIcon: const Icon(Icons.lock_outline),
              prefixIconColor: Sabitler.primaryColor,
            ),
            validator: (value) => !(value!.length >= 6)
                ? 'Şifre en az 6 karakter içermelidir'
                : null,
            onSaved: (newValue) {
              _sifre = newValue!;
            },
          ),
          Sabitler.spaceSmall,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Sabitler.primaryColor,
                  foregroundColor: Colors.white),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Sabitler.primaryColor.withOpacity(0.9),
                    content: Text(
                      'Oturum Açıldı\nEmail adresi: $_email\nŞifre: $_sifre',
                      style: const TextStyle(fontSize: 18),
                    ),
                    duration: const Duration(seconds: 2),
                  ));
                  _formKey.currentState!.reset();
                  Navigator.of(context).popAndPushNamed('main');
                }
              },
              child: const Text(
                'Oturum Açın',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
