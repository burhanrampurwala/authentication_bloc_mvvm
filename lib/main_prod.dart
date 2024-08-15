

import 'app_config/app_environments.dart';
import 'common/resources/enum.dart';
import 'main.dart';

void main() {
  AppEnvironments.setEnvironment(Environment.prod);
  mainForEnvironment();
}