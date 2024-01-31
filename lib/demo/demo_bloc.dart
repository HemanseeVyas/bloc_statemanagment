import 'package:bloc/bloc.dart';

import 'demo_event.dart';
import 'demo_state.dart';

// class DemoBloc extends Bloc<DemoEvent, DemoState> {
class DemoBloc extends Bloc<DemoEvent, int> {
  // DemoBloc() : super(DemoState().init()) {
  DemoBloc() : super(0) {
    // on<InitEvent>(_init);
    on<InitEvent>((event, emit) {

      //emit same as work of return
      emit(0);
    },);


    on<sum_event>((event, emit) {

      int sum=int.parse(event.a)+int.parse(event.b);
      emit(sum);
    });
  }

  // void _init(InitEvent event, Emitter<DemoState> emit) async {
  //   emit(state.clone());
  // }


}
