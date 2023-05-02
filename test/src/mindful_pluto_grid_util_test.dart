// ignore_for_file: prefer_const_constructors, flutter_style_todos

import 'package:flutter_test/flutter_test.dart';
import 'package:mindful_pluto_grid_util/mindful_pluto_grid_util.dart';
import 'package:pluto_grid/pluto_grid.dart';

class Foo {}

void main() {
  group('PlutoGridBuilder', () {
    test('can be instantiated', () {
      List<PlutoRow> rowsBuilder<Foo>(List<Object> data) => [];
      expect(
        PlutoGridBuilder<Foo>(
          data: const [],
          columns: const [],
          rowsBuilder: rowsBuilder<Foo>,
        ),
        isNotNull,
      );
    });
  });

  group('PlutoRiverpodGridBuilder', () {
    test('can be instantiated', () {
      // ignore: unused_element
      List<PlutoRow> rowsBuilder<Foo>(List<Object> data) => [];
//TODO needs work      AsyncValue<List<Foo>> asyncData = makeAsync();
//       expect(
//           PlutoRiverpodGridBuilder<Foo>(
//               asyncData: asyncData, columns: [],
//               rowsBuilder: rowsBuilder<Foo>),
//           isNotNull);
    });
  });
}
