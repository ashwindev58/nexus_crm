import 'package:flutter/material.dart';
import 'core/config/env_config.dart';
import 'main.dart' as app;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EnvConfig.initialize(AppEnvironment.prod);
  app.main();
}
