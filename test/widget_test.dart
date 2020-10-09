import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_itunes_player/main.dart';

class MockDio extends Mock implements Dio {}

void main() {
  testWidgets('Renders initial screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(MusicPlayer), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Search artist...'), findsOneWidget);
    expect(find.byType(ListTile), findsNothing);
  });

}
