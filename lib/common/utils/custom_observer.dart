import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomObserver extends BlocObserver {
  const CustomObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('${bloc.runtimeType} $change');
  }
}
