import 'package:flutter/material.dart';

import 'app.dart';
import 'injector_container.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}

/// flutter pub run flutter_launcher_icons:main
/// flutter run -d windows
/// flutter build apk --release
/// flutter build apk --split-per-abi
/// flutter build appbundle --release
/// flutter pub run build_runner watch --delete-conflicting-outputs
/// flutter pub ipa
/// dart fix --apply





