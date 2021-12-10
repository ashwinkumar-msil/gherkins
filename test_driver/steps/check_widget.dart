import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

class CheckWidget extends Then1WithWorld<String, FlutterWorld> {
  CheckWidget()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 10));

  @override
  Future<void> executeStep(String value) async {
    await world.driver?.waitFor(find.byValueKey(value));
  }

  @override
  RegExp get pattern => RegExp(r"I see if the widget {string} exists");
}