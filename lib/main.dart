import 'dart:async';

import 'package:cupizz_app/src/models/index.dart';
import 'package:flutter/cupertino.dart';

import 'src/app.dart';
import 'src/base/base.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var configuredApp = AppConfig(
    appName: 'Cupizz Production',
    flavorName: AppFlavor.PRODUCTION,
    apiUrl: 'https://cupizz.cf/graphql',
    wss: 'ws://cupizz.cf/graphql',
    child: App(),
    sentryDsn:
        'https://22054fae83f14f0180e198172b3a4e9c@o494162.ingest.sentry.io/5564533',
  );

  objectMapping();
  runZoned<Future<void>>(() async {
    runApp(configuredApp);
  }, onError: (error, stackTrace) {
    configuredApp.sentry.captureException(
      error,
      stackTrace: stackTrace,
    );
  });
}
