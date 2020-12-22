import 'package:cupizz_app/src/models/index.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/base/base.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var configuredApp = AppConfig(
    appName: 'Cubiz Development',
    flavorName: AppFlavor.DEVELOPMENT,
    apiUrl: 'http://192.168.1.242:2020/graphql',
    wss: 'ws://192.168.1.242:2020/graphql',
    child: App(),
    sentryDsn:
        'https://22054fae83f14f0180e198172b3a4e9c@o494162.ingest.sentry.io/5564533',
  );

  objectMapping();
  runApp(configuredApp);
}
