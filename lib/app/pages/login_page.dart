import 'package:flutter/material.dart';
import 'package:izifood/app/controllers/keys.dart';
import 'package:izifood/app/pages/widgets/textfield_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              bottom: 0.0,
              child: Container(
                  child: Image.asset('assets/images/background.png'))),
          Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                    Colors.white,
                    Colors.white24,
                    Colors.transparent
                  ])),
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70.0),
                  Text('Olá!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35.0)),
                  SizedBox(height: 10),
                  Text('Está pronto para mudar sua vida?',
                      style: TextStyle(fontSize: 15.0)),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 5.0, right: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 10.0),
                            child: Text('Seu Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0)),
                          ),
                          textFieldWidget(
                              emailController, false, 'contato@teste.com.br'),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25, left: 15.0, bottom: 15.0),
                            child: Text('Senha',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0)),
                          ),
                          textFieldWidget(passController, true, '**********'),
                          SizedBox(height: 30.0),
                          Center(
                            child: Container(
                              width: 400,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xffff2956),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: FlatButton(
                                onPressed: () {},
                                child: Center(
                                    child: Text('Fazer login',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white))),
                              ),
                            ),
                          ),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Image.asset(
                              'assets/images/logo.png',
                              width: MediaQuery.of(context).size.width * 0.60,
                            ),
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
