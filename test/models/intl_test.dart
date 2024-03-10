import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart' as intl;

void main() {
  test("3桁区切りのテスト", () {
    intl.NumberFormat formatter = intl.NumberFormat("#,###", 'en_US');
    expect(formatter.format(123), "123");
    expect(formatter.format(1234), "1,234");
    expect(formatter.format(1234567), "1,234,567");
    expect(formatter.format(123456789), "123,456,789");
  });

  test("小数点", () {
    intl.NumberFormat formatter = intl.NumberFormat("#,###.########", 'en_US');
    expect(formatter.format(1.23), "1.23");
    expect(formatter.format(12.34), "12.34");
    expect(formatter.format(1234.567), "1,234.567");
    expect(formatter.format(1.23456789), "1.23456789");
    expect(formatter.format(0.00000001), "0.00000001");

    //別で対応する 以下の場合エラー
    // expect(formatter.format(0.0), "0.0");
    // expect(formatter.format(0.00000001), "0.00000001");
    expect(formatter.format(1230.01), "1,230.01");
  });
}
