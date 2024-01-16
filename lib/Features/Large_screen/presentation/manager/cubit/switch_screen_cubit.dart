import 'package:bloc/bloc.dart';
part 'switch_screen_state.dart';

class SwitchScreenCubit extends Cubit<SwitchScreenState> {
  SwitchScreenCubit() : super(SwitchScreenInitial());

  int currentscreen = 0;

  void changeScreen() {
    currentscreen++;
    emit(AppChangeScreen());
  }

  void changeScreen2() {
    emit(AppChangeScreen());
  }
}
