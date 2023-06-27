import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeStore extends Cubit<bool> {
  ThemeStore() : super(false);

  void setTheme(bool isDarkTheme) => emit(isDarkTheme);
}

// enum ThemeType {
//   dark,
//   light,
// }