import 'package:bloc/bloc.dart';
part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarState(currentIndex: 0));

  setSelectedIndex(int index) => emit(NavBarState(currentIndex: index));
}
