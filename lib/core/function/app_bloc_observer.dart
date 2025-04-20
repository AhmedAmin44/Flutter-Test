import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print('BLoC created: ${bloc.runtimeType}');
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print('Event: ${event.runtimeType} in ${bloc.runtimeType}\n$event');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('''
State change in ${bloc.runtimeType}:
Current state: ${change.currentState.runtimeType}
Next state: ${change.nextState.runtimeType}
''');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print('''
Transition in ${bloc.runtimeType}:
Event: ${transition.event.runtimeType}
From: ${transition.currentState.runtimeType}
To: ${transition.nextState.runtimeType}
''');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('Error in ${bloc.runtimeType}:\n$error\n$stackTrace');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      print('BLoC closed: ${bloc.runtimeType}');
    }
  }
}