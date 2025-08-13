import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 1. تصحيح اسم الفئة (BlocObserver بدلاً من BlocObserrver)
class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    debugPrint('Change in $bloc: $change');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    debugPrint('Closed: $bloc');
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    debugPrint('Created: $bloc');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    debugPrint('Error in $bloc: $error\n$stackTrace');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    debugPrint('Event in $bloc: $event');
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    debugPrint('Transition in $bloc: $transition');
  }
}