import 'package:flutter/cupertino.dart';

import 'src/app.dart';
import 'src/base/base.dart';

void main() {
  var configuredApp = new AppConfig(
    appName: 'Cubizz Production',
    flavorName: AppFlavor.PRODUCTION,
    apiUrl: 'https://cubizz.cf',
    child: App(),
  );

  runApp(configuredApp);
}
