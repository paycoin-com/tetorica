import 'package:tetorica/cipher/hex.dart';
import 'dart:convert';
import 'package:test/test.dart' as test;
import 'dart:typed_data';

main() {
  test.group("hex", () {
    test.test("decode A", () {
      Uint8List r = new Uint8List(100);
      List<int> inputValue = ASCII.encode("0xAFFA0990");
      int l = Hex.decode(inputValue, 0, inputValue.length, r, 0, r.length);
      print("${inputValue}");
      test.expect(r.sublist(0, l), [0xAF, 0xFA, 0x09, 0x90]);
    });

    //[48, 120, 65, 70, 70, 65, 48, 57, 57, 48]
    test.test("encode A", () {
      Uint8List r = new Uint8List(100);
      List<int> inputValue = [0xAF, 0xFA, 0x09, 0x90];
      int l = Hex.encode(inputValue, 0, inputValue.length, r, 0, r.length);
      print("${inputValue}");
      test.expect(ASCII.decode(r.sublist(0, l)), "0xaffa0990");
    });
  });
}
