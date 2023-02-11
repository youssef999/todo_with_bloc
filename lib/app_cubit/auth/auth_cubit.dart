
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app_cubit/auth/auth_states.dart';


 class AuthCubit extends Cubit<AuthStates> {

  AuthCubit() :super(AppIntialState());
  // objects mn nfsy
  static AuthCubit get(context) => BlocProvider.of(context);

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
   final FirebaseAuth _auth = FirebaseAuth.instance;
  final box = GetStorage();


  void Register() async {

    emit(RegisterLoadingState());
    if(email.text.length>6&&email.text.contains('@')==true&&password.text.length>5&&
        name.text.length>2){
      try {
        await _auth.createUserWithEmailAndPassword(email: email.text, password: password.text)
            .then((user) async {

          box.write('email', email);
          box.write('name', name);
          emit(RegisterSuccessState());
        });


      }



      catch (e) {
        print(e.toString());
        emit(RegisterErrorState(e.toString()));
      }
    }
    else{
      emit(RegisterErrorState("Error"));
    }
  }



  void Login() async {


        emit(LoginLoadingState());
      try {
       await _auth
            .signInWithEmailAndPassword(email: email.text, password: password.text)
            .then((value) async {
          box.write('email', email.text);
          box.write('pass', password.text);
          emit(LoginSuccessState());
       });


      } catch (e) {
        emit(LoginErrorState(e.toString()));


      }
    }


  }






