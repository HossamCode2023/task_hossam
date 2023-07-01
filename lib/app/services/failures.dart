// import 'package:get/utils.dart';

abstract class Failures {
  final String failures = '';
}

class SomthingWrongFailures implements Failures {
  @override
  String get failures => 'Somthing Wrong';
}
