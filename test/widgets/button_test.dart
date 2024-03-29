import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_sample/widgets/button.dart';

void main() {
  testWidgets("Button", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Button("0", Colors.black, Colors.white, null),
      ),
    );

    await tester.pump();
    expect(find.text("0"), findsOneWidget);
    expect(find.text("1"), findsNothing);
  });

  group("押された時の処理", () {
    testWidgets("1", (WidgetTester tester) async {
      String result = "";
      FunctionOnPressed onPress = (String text) {
        result = text;
      };

      await tester.pumpWidget(
        MaterialApp(
          home: Button("1", Colors.black, Colors.white, onPress),
        ),
      );

      await tester.pump();
      expect(result, "");

      //仮想アプリ上で"1"と書かれたテキストを見つける
      Finder finder = find.text("1");
      await tester.tap(finder);
      expect(result, "1");
    });

    testWidgets("2", (WidgetTester tester) async {
      String result = "";
      FunctionOnPressed onPress = (String text) {
        result = text;
      };

      await tester.pumpWidget(
        MaterialApp(
          home: Button("2", Colors.black, Colors.white, onPress),
        ),
      );

      await tester.pump();
      expect(result, "");

      await tester.tap(find.text("2"));
      expect(result, "2");
    });
  });

  group("色", () {
    testWidgets("1", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Button("1", Colors.black, Colors.white, null),
        ),
      );

      await tester.pump();

      //byType:TextというクラスのものやMaterialといったクラスのものを探す
      Finder finder = find.byType(Material);
      Material material = tester.widget(finder);
      expect(material.color, Colors.black);
      expect(material.textStyle?.color, Colors.white);
    });

    testWidgets("2", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Button("2", Colors.white, Colors.black, null),
        ),
      );

      await tester.pump();

      //byType:TextというクラスのものやMaterialといったクラスのものを探す
      Finder finder = find.byType(Material);
      Material material = tester.widget(finder);
      expect(material.color, Colors.white);
      expect(material.textStyle?.color, Colors.black);
    });
  });
}
