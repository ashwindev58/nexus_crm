import 'package:flutter/material.dart';
import 'core/config/env_config.dart';
import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    EnvConfig.instance;
  } catch (_) {
    EnvConfig.initialize(AppEnvironment.dev);
  }
  runApp(const AuraCRMApp());
}


