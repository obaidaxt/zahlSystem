// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_application_1/numberConverter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Binary to Decimal', () {
    expect((binaryToDecimal('0')), '0');
    expect((binaryToDecimal('01')), '1');
    expect((binaryToDecimal('0000')), '0');
    expect((binaryToDecimal('0101')), '5');
    expect((binaryToDecimal('0111')), '7');
  });

  test('convert result from String to int', () {
    expect((stringToListInt('12')), [1, 2]);
    expect((stringToListInt('1285')), [1, 2, 8, 5]);
  });

  test('DecimalToBinary', () {
    expect(decimalToBinary('0'), '0');
    expect(decimalToBinary('1'), '1');
    expect(decimalToBinary('2'), '10');
    expect(decimalToBinary('3'), '11');
    expect(decimalToBinary('4'), '100');
    expect(decimalToBinary('5'), '101');
    expect(decimalToBinary('1025'), '10000000001');
  });

  test('DecimalToDexadecimal', () {
    expect(decimalToHecadecimal('0'), '0');
    expect(decimalToHecadecimal('1'), '1');
    expect(decimalToHecadecimal('15'), 'F');
    expect(decimalToHecadecimal('16'), '10');
    expect(decimalToHecadecimal('255'), 'FF');
    expect(decimalToHecadecimal('256'), '100');
  });

  test('hex to decimal', () {
    expect(hexToDec('F'), 15);
    expect(hexToDec('F3'), 243);
    expect(hexToDec('3F'), 63);
  });

  test('Hexadecimal to binary', () {
    expect(hexToBin('F'), '1111');
    expect(hexToBin('f'), '1111');
    expect(hexToBin('a'), '1010');
    expect(hexToBin('9'), '1001');
  });

  // test('DecimalToDecimal', () {
  //   for (var i = 0; i < 10000; i++) {
  //     expect(decimalToX(i.toString(), 10), i.toString());
  //   }

  // });
  // test('Hexa to Decimal', () {
  //   expect(stringToListHexa('A'), [10]);
  //   expect(stringToListHexa('B'), [11]);
  //   expect(stringToListHexa('C'), [12]);
  //   expect(stringToListHexa('F'), [15]);
  // });
  // test('Hexa to Decimal String', () {
  //   expect(hexaZuDezimal('22'), '34');
  //   expect(hexaZuDezimal('55'), '85');
  //   expect(hexaZuDezimal('F'), '15');
  // });
  // test(' Decimal String', () {
  //   expect(dezimalZuBinaere('7'), [1, 1, 1]);
  //   expect(dezimalZuBinaere('77'), [1, 0, 0, 1, 1, 0, 1]);
  // });
  // });
}
