import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/dependency/dependency_injection.dart';

void main(){
  DependencyInjection di = DependencyInjection();
  di.dependencies();
  runApp(NoteTaker());
}