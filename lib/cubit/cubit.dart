
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>{


  CounterCubit():super(CounterIntialState());

  // ANDH 3LA HAGA GWA CLASS MN 8ER MA5D OBJECT MNO
  static CounterCubit get(context) =>BlocProvider.of(context);

  int  counter=1;

  void minus(){
    counter -- ;
    emit(CounterMinusState(counter: counter));
  }
  void plus(){
    counter ++ ;
    emit(CounterPlusState(counter: counter));
  }

}