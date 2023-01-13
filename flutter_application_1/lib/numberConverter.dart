// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';

class NumberConverter extends StatelessWidget {
  const NumberConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

List<int> stringToListInt(String? n) {
  List<int> toIntResult = [];
  if (n != null) {
    for (int i = 0; i < n.length; i++) {
      if (int.tryParse(n[i]) != null) {
        toIntResult.add(int.parse(n[i]));
      }
    }
  }
  return toIntResult;
}

String binaryToDecimal(String binaryNumber) {
  final binaryString = stringToListInt(binaryNumber);
  int add = 1;
  int result = 0;
// int numbers = List<numbers>;
  for (int i = binaryString.length - 1; i >= 0; i--) {
    result = result + binaryString[i] * add;
    add *= 2;
  }

  return result.toString();
}
//Hexa to List Int

String hexToDec(String x) {
  // A0
  x = x.toUpperCase();
  if (x.isEmpty) {
    return '';
  }
  int result = 0;
  int count = x.length - 1; // 1
  for (int i = 0; i < x.length; i++) {
    // 2mal (0,1)
    int temp = 0;
    switch (x[count]) {
      case 'A':
        temp = 10; // 10
        break;
      case 'B':
        temp = 11;
        break;
      case 'C':
        temp = 12;
        break;
      case 'D':
        temp = 13;
        break;
      case 'E':
        temp = 14;
        break;
      case 'F':
        temp = 15;
        break;
      default:
        temp = int.parse(x[count]);
    }

    result = result + (temp * (pow(16, i) as int));
    count--;
  }

  return result.toString();
}

String decimalToBinary(String decimal) => decimalToX(decimal, 2);

String decimalToHecadecimal(String decimal) => decimalToX(decimal, 16);

String decimalToX(String decimal, int base) {
  // base 2
  var result = '';
  int value = int.tryParse(decimal) ?? 0; // 7
  if (value == 0) return '0';
  var i = 0;
  while (pow(base, i) <= value) {
    // 2^3 = 8 || > 7
    i++; //3
  }
  i--; // 2
  var rest = value; // num 7 || rest=3
  while (i >= 0) {
    final divisor = pow(base, i) as int; // 2^2= 4 | true || 2^1=2(divisor) || 2^0=1
    final ziffer = rest ~/ divisor; // 8 ||7/4=1, ~ ziffer = 1 || 3/2=~1 || 1 /1=1
    rest = rest - divisor * ziffer; // 7-(4*1) =3 neuer rest 3 || 3-(2*1)=neuer rest =1 || 1-1=0
    i--; // 2-1=1 ||1-1=0
    result = result + translateZiffer(ziffer); // decimal=7 |  binary= 111
  }
  return result;
}

const translate = {
  10: 'A',
  11: 'B',
  12: 'C',
  13: 'D',
  14: 'E',
  15: 'F',
};

String translateZiffer(int ziffer) {
  if (ziffer < 10) return ziffer.toString();
  return translate[ziffer] ?? 'X';
}

List<int>? dezimalZuBinaere(String? eingabe) {
  int zahl = int.parse(eingabe!);

  List<int> result = [0];

  while (zahl > 0) {
    int element = 0;

    if (result[element] == 0) {
      result[element] = 1; // [1] || [1,1] ||[1,1,1]

      zahl--; // 6 || 4 || 2

    } else {
      while (result.length > element + 1 && result[element] != 0) {
        result[element] = 0; // [0,1] || [0,0,1]

        element++; //2
      }

      if (result.length == element + 1) {
        result.add(1); //[1,1] ||[0,1,1]||[1,0,1,1]

        result[element] = 0; //[0,1]  || [0,1,1]

      } else {
        result[element] = 1;
      }

      zahl--; // 5 ||3||1

    }
  }

  List<int>? resu = result.reversed.toList();
  return resu;
}

//Hex to binary

String hexToBin(String hexdec) {
  //2
  String result = '';
  hexdec = hexdec.toUpperCase();
  for (var i = 0; i < hexdec.length; i++) {
    if (hexdec[i] == '0') {
      result += '0000';
    } else if (hexdec[i] == '1') {
      result += '0001';
    } else if (hexdec[i] == '2') {
      result += '0010';
    } else if (hexdec[i] == '3') {
      result += '0011';
    } else if (hexdec[i] == '4') {
      result += '0100';
    } else if (hexdec[i] == '5') {
      result += '0101';
    } else if (hexdec[i] == '6') {
      result += '0110';
    } else if (hexdec[i] == '7') {
      result += '0111';
    } else if (hexdec[i] == '8') {
      result += '1000';
    } else if (hexdec[i] == '9') {
      result += '1001';
    } else if (hexdec[i] == 'A') {
      result += '1010';
    } else if (hexdec[i] == 'B') {
      result += '1011';
    } else if (hexdec[i] == 'C') {
      result += '1100';
    } else if (hexdec[i] == 'D') {
      result += '1101';
    } else if (hexdec[i] == 'E') {
      result += '1110';
    } else if (hexdec[i] == 'F') {
      result += '1111';
    }
  }

  // while (hexdec.length > i) {
  //   //1
  //   var value = hexdec[i];
  //   switch (hexdec[i]) {
  //     case '0':
  //       result += '0000';
  //       break;
  //     case '1':
  //       result += '0001';
  //       break;
  //     case '2':
  //       result += '0010';
  //       break;
  //     case '3':
  //       result += '0011';
  //       break;
  //     case '4':
  //       result += '0100';
  //       break;
  //     case '5':
  //       result += '0101';
  //       break;
  //     case '6':
  //       result += '0110';
  //       break;
  //     case '7':
  //       result += '0111';
  //       break;
  //     case '8':
  //       result += '1000';
  //       break;
  //     case '9':
  //       result += '1001';
  //       break;
  //     case 'A':
  //       result += '1010';
  //       break;
  //     case 'B':
  //       result += '1011';
  //       break;
  //     case 'C':
  //       result += '1100';
  //       break;
  //     case 'D':
  //       result += '1101';
  //       break;
  //     case 'E':
  //       result += '1110';
  //       break;
  //     case 'F':
  //       result += '1111';
  //       break;
  //     default:
  //       ('invalid value${hexdec[i]}');
  //   }
  //   i++;
  // }
  return result;
}
