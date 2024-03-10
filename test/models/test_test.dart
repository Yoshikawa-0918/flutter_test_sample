import 'package:flutter_test/flutter_test.dart';

void main() {
  int getValue() {
    return 1;
  }

  int? getNullable() {
    return 1;
  }

  int? getNull() {
    return null;
  }

  test('expect', () async {
    int i = 1;
    expect(i, 1);
    expect(getValue(), 1);
    expect(getNullable(), 1);
    expect(getNull(), null);

    expect(getValue(), equals(1));
    expect(true, true);
    expect(1.1, 1.1);
  });

  test('数値用のMatcher', () async {
    expect(getValue(), equals(1));
    expect(getValue(), isPositive);
    expect(-getValue(), isNegative);
    expect(getValue(), isNonNegative);
    expect(-getValue(), isNonPositive);

    ///0はPositiveでもNegativeでもない
    expect(0, isNonPositive);
    expect(0, isNonNegative);

    expect(0, isZero);
    expect(getValue(), isNonZero);

    ///equalsは少数にも対応している
    expect(1.1, equals(1.1));
  });

  test('数値の範囲のMatcher', () async {
    ///より大きい(<)
    expect(5, greaterThan(4));

    ///以上(≦)
    expect(5, greaterThanOrEqualTo(5));

    ///より小さい(>)
    expect(4, lessThan(5));

    ///以下(≧)
    expect(4, lessThanOrEqualTo(4));

    ///引数の値を含む範囲
    expect(5, inInclusiveRange(4, 5));

    ///引数の値を含まない範囲
    expect(5, inExclusiveRange(4, 6));

    ///第１引数を含むが、第２引数は含まない範囲
    expect(5, inClosedOpenRange(5, 6));

    ///第１引数を含まないが、第２引数は含む範囲
    expect(6, inOpenClosedRange(5, 6));

    ///第１引数が±第２引数の値まで許容する
    ///例：closeTo(2,1) → 2の±1まで許容する → 1~3までの範囲
    expect(2, closeTo(2, 1));
  });

  test('文字列のMatcher', () async {
    String str = "abcd";
    expect(str, "abcd");

    ///文字列に引数の値が含まれているか
    expect(str, contains("bc"));

    ///文字列が引数の値で始まっているか
    expect(str, startsWith("a"));

    ///文字列が引数の値で終わっているか
    expect(str, endsWith("d"));

    ///大文字小文字の違いを無視する
    expect("abcD", equalsIgnoringCase("abcd"));

    ///最初と最後のスペースを無視する
    expect(" abcd ", equalsIgnoringWhitespace("abcd"));

    ///文字が順番通りに並んでいるか(文字の間に文字があっても順番通りに並んでいたらOK)
    expect("abcd", stringContainsInOrder(["a", "b", "c", "d"]));

    expect(str, hasLength(4));
    expect(str.length, 4);
  });

  test("nullのMatcher", () async {
    int? nullableValue = getNullable();
    expect(nullableValue, 1);

    ///nullではない
    expect(nullableValue, isNotNull);

    int? nullValue = getNull();
    expect(nullValue, null);

    ///nullである
    expect(nullValue, isNull);
  });

  test("例外のMatcher", () async {
    Exception ex = Exception();

    ///例外である
    expect(ex, isException);

    ///例外が発生したことを確認する
    expect(() {
      throw Exception();
    }, throwsA(isInstanceOf<Exception>()));

    try {
      ///exception testというエラーを投げる
      throw FormatException("exception test");
    } on FormatException catch (e) {
      ///エラー文が正しいかテストする
      expect(e.message, "exception test");
    } catch (e) {
      ///想定外の例外の場合、failでテスト失敗とする
      fail("Different exception");
    }
  });

  test("ListのMatcher", () async {
    List list = [1, 2, 3, 4, 5];

    ///Listの要素数を調べる
    expect(list, hasLength(5));
    expect(list.length, greaterThan(3));

    ///要素が含まれているか
    expect(list, contains(1));

    ///要素が全て含まれているか
    expect(list, containsAll([1, 3]));

    ///要素が全て順番に含まれているか
    expect(list, containsAllInOrder([1, 3, 5]));

    ///要素数と要素と順番が一致しているか
    expect(list, orderedEquals([1, 2, 3, 4, 5]));

    ///要素数と要素が一致しているか(順番は異なっても良い)
    expect(list, unorderedEquals([1, 2, 3, 5, 4]));
  });
}
