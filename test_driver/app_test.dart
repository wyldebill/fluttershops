// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';




// use this to start the integration test, flutter drive --target=test_driver/app.dart
// https://flutter.dev/docs/cookbook/testing/integration/introduction
// 
void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final tabToLoadMap = find.byValueKey('tab_map');
    //final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    // test('starts at 0', () async {
    //   // Use the `driver.getText` method to verify the counter starts at 0.
    //   expect(await driver.getText(counterTextFinder), "0");
    // });

    test('just run the app', () async {
      // First, tap the button.
      //await driver.tap(tabToLoadMap);

      // Then, verify the counter text is incremented by 1.
      //expect(await driver.getText(counterTextFinder), "1");
      expect("1", "1");
      
    });
  });
}