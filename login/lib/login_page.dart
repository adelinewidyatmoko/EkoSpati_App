import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";

final formKey = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType{
  login,
  regis, register
}

class _LoginPageState extends State<LoginPage> {

  final formKey =  GlobalKey<FormState>();

  late String _email;
  late String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;

  }

  Future<void> validateAndSubmit() async {
    if (validateAndSave == true){
      try {
        if(_formType == FormType.login){
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        print('Signed in: ${user.user!.uid}');
      }else{
        UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        print('Register user: ${user.user!.uid}');
        }
      }
      catch (e) {
        print('Error: $e');
      }

    }
  }

  void moveToRegister(){
    formKey.currentState?.reset();
    setState(() {
       _formType = FormType.register;
    });
  }

  void moveToLogin(){
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text('flutter login demo'),
        ),
        body: Container(

            padding: const EdgeInsets.all(16.0),
            color: Colors.grey,
            child: Form(
              key: formKey,// add this line
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildInputs() + buildSubmitButtons(),
              ),
            ))); //widget

  }
  List<Widget> buildInputs(){
    return [
      TextFormField(
        decoration: const InputDecoration(labelText: 'Email'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'please enter your email';
          }
          return null;
        },
        onSaved: (value) {
          _email = value ?? '';
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value)  {
          if (value == null || value.isEmpty) {
            return 'please enter your password';
          }
          return null;
        },
        onSaved: (value) {
          _password = value ?? '';
        },
      ),
    ];
  }
  List<Widget> buildSubmitButtons(){
    if ( _formType == FormType.login) {
      return [
        ElevatedButton(
          onPressed: validateAndSubmit,
          child:
          const Text('Login', style: TextStyle(fontSize: 20.0)),
        ),
        TextButton(
          child: Text('Create an Account', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToRegister,
        ),
      ];
    }else{
      return [
        ElevatedButton(
          onPressed: validateAndSubmit,
          child:
          const Text('Create an Account', style: TextStyle(fontSize: 20.0)),
        ),
        TextButton(
          child: Text('Already an Account', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        ),
      ];

    }
  }
}



