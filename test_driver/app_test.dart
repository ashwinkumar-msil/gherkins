import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/check_scroll.dart';
import 'steps/check_text.dart';
import 'steps/check_widget.dart';
import 'steps/click_icon.dart';
import 'steps/initial_state.dart';
import 'steps/tabclick.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ]
    ..stepDefinitions = [
      InitialStateOfApp(),
      CheckScroll(),
      CheckScrollUp(),
      ClickIcon(),
      CheckText(),
      CheckWidget(),
      TabClick()
    ]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart";
  //..exitAfterTestRun = true;
  return GherkinRunner().execute(config);
}
