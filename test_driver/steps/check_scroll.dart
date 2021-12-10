import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

class CheckScroll extends AndWithWorld<FlutterWorld> {
  CheckScroll()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    final listView = find.byValueKey('contactListView');
    await world.driver
        ?.scroll(listView, 0, -2200, const Duration(milliseconds: 2000));
  }

  @override
  RegExp get pattern => RegExp(r"I scroll to end of the list");
}

class CheckScrollUp extends AndWithWorld<FlutterWorld> {
  CheckScrollUp()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    final listView = find.byValueKey('contactListView');
    await world.driver
        ?.scroll(listView, 0, 2200,const Duration(milliseconds: 2000));
  }

  @override
  RegExp get pattern => RegExp(r"I scroll to up of the list");
}


