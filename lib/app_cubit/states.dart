

abstract class AppStates{
}


class AppIntialState extends AppStates{


}

class ChangeBottomNavBarState extends AppStates{

}
class CreateDataBaseState extends AppStates{

}

class CreateDataBaseGoalState extends AppStates{

}

class CreateDataBaseGoalsState extends AppStates{

}


class CreateDataBaseState3 extends AppStates{

}
class GetDataBaseState extends AppStates{

}

class GetDataBase3State extends AppStates{

}

class GetGoalsState extends AppStates{

}

class InsertToDataBase extends AppStates{

}

class InsertGoalsToDataBase extends AppStates{

}

class InsertGoalsErrorState extends AppStates{

}

class InsertToDataBase3 extends AppStates{

}



class ShowPopUpMenu extends AppStates{

}

class ChangeBottomSheet extends AppStates{

}class GetDataBaseLoadingState extends AppStates{

}

class GetDataBase3LoadingState extends AppStates{

}

class UpdateDataBaseState extends AppStates{

}

class UpdateDataBaseState3 extends AppStates{

}
class EditDataBaseState extends AppStates{

}
class DeleteDataBaseState extends AppStates{

}

class ChangeLangState extends AppStates{

}

class ChangeDropDownValue extends AppStates{

}
class LoginSuccessState extends AppStates{


}

class LoginLoadingState extends AppStates{

}

class LoginErrorState extends AppStates{

  final String error;

  LoginErrorState(this.error);
}


class RegisterSuccessState extends AppStates{

}

class RegisterLoadingState extends AppStates{

}

class RegisterErrorState extends AppStates{

  final String error;

  RegisterErrorState(this.error);
}
