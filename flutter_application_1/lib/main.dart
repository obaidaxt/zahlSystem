// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/numberConverter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Zahl System Umrechner';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // TextEditingController editDecimal = TextEditingController();

  // TextEditingController editBinary = TextEditingController();

  // TextEditingController editHexadecimal = TextEditingController();

  // TextEditingController editResult = TextEditingController();

  // TextEditingController editResult2 = TextEditingController();

  var resultDez = '';
  var resultHex = '';
  var resultBin = '';
  var eingabeTyp = '';

  @override
  Widget build(BuildContext context) {
    print('runs');
    print('resultDez: $resultDez');
    print('resultHex: $resultHex');
    print('resultBin: $resultBin');
    print('eingabeTyp: $eingabeTyp');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: false,
          child: Text("Invisible"),
        ),
        Visibility(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              autofocus: true,
              onChanged: (value) {
                print('Eingabe Binär: $value');
                setState(() {
                  resultDez = calculateDecimalFromBinaryString(binaryToDecimal(value));
                  resultHex = calculateHexadecimalFromDecimalString(decimalToHecadecimal(binaryToDecimal(value)));
                  eingabeTyp = 'Binär';
                });
              },
              decoration: const InputDecoration(
                labelText: 'Gib ein Binärzahl ein, um zu Dezimal oder Hexadezimal umzumrechnen',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                // editDecimal.text = value;
                print('Eingabe Dezimalzahl: $value');
                resultBin = calculateBinaryFromDecimalString(decimalToBinary(value));

                resultHex = calculateHexadecimalFromDecimalString(decimalToHecadecimal(value));
                eingabeTyp = 'Dezimalzahl';
              });
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Gib ein Dezimalzahl ein, um zu Binär oder Hexadezimal umrechnen',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                print('Eingabe hex: $value');
                resultBin = calculateBinaryFromDecimalString(hexToDec(value));
                resultDez = calculateDecimalFromBinaryString(hexToBin(value));
                eingabeTyp = 'Hexadezimalzahl';
              });
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Gib ein Hexadezimalzahl ein, um Binär oder Dezimalzahl umzurechnen',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 30,
            right: 30,
            bottom: 25,
          ),
          child: Center(
            child: Container(
              color: const Color.fromARGB(255, 174, 205, 236),
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text("Ergebniss"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: eingabeTyp == 'Binär'
                        ? Text(resultDez)
                        : (eingabeTyp == 'Hexadezimalzahl'
                            ? Text(resultDez)
                            : (eingabeTyp == 'Dezimalzahl' ? Text('binär: $resultBin') : const Text(''))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: eingabeTyp == 'Binär'
                        ? Text(resultHex)
                        : (eingabeTyp == 'Hexadezimalzahl'
                            ? Text(resultBin)
                            : (eingabeTyp == 'Dezimalzahl' ? Text(' hex: $resultHex') : const Text(''))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String calculateDecimalFromBinaryString(String value) {
    return value;
  }

  String calculateHexadecimalFromDecimalString(String value) {
    return value;
  }

  String calculateBinaryFromDecimalString(String value) {
    return value;
  }
}
