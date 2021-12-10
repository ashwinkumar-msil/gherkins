import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';


class TabClick extends When1WithWorld<String,FlutterWorld> {

   TabClick()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 10));
  @override
  Future<void> executeStep(String vlaue ) async {
    final locator = find.byValueKey('tab1');
    await FlutterDriverUtils.tap(world.driver, locator);
      
  }


  @override
  RegExp get pattern => RegExp(r"the user taps on the plus button");
}