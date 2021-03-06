import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DonatePage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  void _showSnackBar(String text) {
    SnackBar snackBar = SnackBar(content: Text(text));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Donar'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Esta aplicación es gratuita y lo seguirá siendo. La '
                'intención es dar a conocer las aplicaciones cubanas de '
                'código abierto.\n\n'
                'Si lo desea, puede ayudar a que el proyecto siga '
                'creciendo realizando una donación. Cualquier contribución, '
                'por pequeña que sea, nos permitirá dedicarle más tiempo y '
                'recursos a la aplicación.\n\n'
                'Muchas gracias de antemano.',
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
                'Equipo de Desarrollo',
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'TRANSFERENCIA DE SALDO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Clave',
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'La clave es necesaria';
                        }
                        if (value.length != 4) {
                          return 'La clave debe tener 4 dígitos';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            onPressed: () async {
                              if (!formKey.currentState.validate()) {
                                return;
                              }
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Nota'),
                                    content: Text(
                                      'A continuación saldrá la pantalla '
                                      'donde se realizan las llamadas '
                                      'con una serie de números ya '
                                      'insertados, presione en el botón para '
                                      'llamar y realizar la donación.\n\n'
                                      'No se preocupe, Etecsa siempre le '
                                      'pedirá una confirmación.',
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Continuar'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                              var uri = Uri(
                                scheme: 'tel',
                                path: '*234*1*53478301*$key#',
                              );
                              if (await canLaunch(uri.toString())) {
                                await launch(uri.toString());
                              } else {
                                throw 'Could not launch $uri';
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                              child: Text(
                                'Transferir',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            color: Theme.of(context).accentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Center(
                child: Text(
                  'Si no recuerda su clave puede llamar al número 52642266 '
                  'para recuperar su clave de transferencia.',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: () async {
                        var uri = Uri(
                          scheme: 'tel',
                          path: '+5352642266',
                        );
                        if (await canLaunch(uri.toString())) {
                          await launch(uri.toString());
                        } else {
                          throw 'Could not launch $uri';
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: Text(
                          'Llamar al 52642266',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      color: Theme.of(context).accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
              child: Center(
                child: Text(
                  'TRANSFERENCIA BANCARIA',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Text(
                'Para donar mediante una transferencia bancaria puede '
                'utilizar las aplicaciones de Transfermovil, Enzona o '
                'utilizar las vías tradicionales (Transferencia mediante '
                'un cajero automático o desde un banco hacia la cuenta '
                'que aparece a continación)',
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: GestureDetector(
                child: Center(
                  child: Text(
                    '9224959879396073',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: '9224959879396073'));
                  _showSnackBar('Cuenta bancaria copiada');
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
              child: FlatButton(
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                  child: Text(
                    'Copiar número de la cuenta',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: '9224959879396073'));
                  _showSnackBar('Cuenta bancaria copiada');
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Text(
                'Si sabe como utilizar los QR de Enzona y/o Transfermovil '
                'también puede utilizar los QR a continuación para realizar '
                'la donación.',
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            'Enzona',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/qr_enzona.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          onTap: () async {
                            var uri = Uri(
                              scheme: 'https',
                              path:
                                  'raw.githubusercontent.com/cubaopenplay/cubaopenplay-app/master/assets/images/qr_enzona.png',
                            );
                            if (await canLaunch(uri.toString())) {
                              await launch(uri.toString());
                            } else {
                              throw 'Could not launch $uri';
                            }
                          },
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: FlatButton(
                            color: Theme.of(context).accentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                              child: Text(
                                'Descargar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              var uri = Uri(
                                scheme: 'https',
                                path:
                                    'raw.githubusercontent.com/cubaopenplay/cubaopenplay-app/master/assets/images/qr_enzona.png',
                              );
                              if (await canLaunch(uri.toString())) {
                                await launch(uri.toString());
                              } else {
                                throw 'Could not launch $uri';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            'Transfermovil',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/qr_transfermovil.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          onTap: () async {
                            var uri = Uri(
                              scheme: 'https',
                              path:
                                  'raw.githubusercontent.com/cubaopenplay/cubaopenplay-app/master/assets/images/qr_transfermovil.png',
                            );
                            if (await canLaunch(uri.toString())) {
                              await launch(uri.toString());
                            } else {
                              throw 'Could not launch $uri';
                            }
                          },
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: FlatButton(
                            color: Theme.of(context).accentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                              child: Text(
                                'Descargar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              var uri = Uri(
                                scheme: 'https',
                                path:
                                    'raw.githubusercontent.com/cubaopenplay/cubaopenplay-app/master/assets/images/qr_transfermovil.png',
                              );
                              if (await canLaunch(uri.toString())) {
                                await launch(uri.toString());
                              } else {
                                throw 'Could not launch $uri';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
