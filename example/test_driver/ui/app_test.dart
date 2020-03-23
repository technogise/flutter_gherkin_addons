import 'dart:async';
import 'package:flutter_gherkin_addons/wrapper.dart';
import '../steps/details_page_steps.dart';
import '../steps/home_page_steps.dart';
import 'steps/mocking_steps.dart';
Future<void> main() async {
  return Bootstrapper.start(
      [
        start(),
        whenINavigateToPersonaList(),
        whenITapOnPersonOnHomePage(),
        thenISeeSomethingAsSomethingOnDetailsPage(),
        thenISeeFollowing(),
        givenFollowingUserExists()
      ]
  );
}