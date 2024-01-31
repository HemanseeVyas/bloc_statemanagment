import 'package:bloc/bloc.dart';

import 'demo1_event.dart';
import 'demo1_state.dart';

class Demo1Bloc extends Bloc<Demo1Event, Demo1State> {
  Demo1Bloc() : super(Demo1State().init()) {
    on<InitEvent>(_init);


    on<sum_event>((event, emit) {
      int sum=int.parse(event.a)+int.parse(event.b);

      //state class ma value add krvii
      emit(sum_state(sum));
    });

    on<sub_event>((event, emit) {
      int sub=int.parse(event.a)-int.parse(event.b);
      emit(sub_state(sub));
    });

    on<str_event>((event, emit) {
      String str=event.str;
      emit(str_state(str));
    });
  }

  void _init(InitEvent event, Emitter<Demo1State> emit) async {
    emit(state.clone());
  }
}
