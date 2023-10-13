import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider((ref) => false);

// Listado de colores inmutables
final colorLisrtProvider = Provider((ref) => colorList);

// Un simple int
final selectedColorProvider = StateProvider((ref) => 0);

// Un Objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Controller o Notifier
// Guardamos una instancia de nuestro aptheme
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = Estdo = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  //Este sirve para cambiar el modo en dark
  void toggleDarkmode() {
    // Podemos acceder a este valor ya que es una instancia de apptheme
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void chanegeIndex(int index) {
    state = state.copyWith(selectedColor: index);
  }
}
