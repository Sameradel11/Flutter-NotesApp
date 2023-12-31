import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(Closable bloc, Change change) {
    debugPrint("Change is $change");
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint(bloc.toString()+"Close");
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint(bloc.toString()+"Created");
  }
  
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }
  
  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }
  
  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
