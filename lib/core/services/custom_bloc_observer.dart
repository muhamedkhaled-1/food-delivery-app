import 'package:bloc/bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    print('''
════════════════════════════════════
Bloc: ${bloc.runtimeType}
Current State: ${change.currentState}
Next State: ${change.nextState}
════════════════════════════════════
''');
  }
}