import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/layouts/goals/show_goals_screen.dart';
import 'package:todo_app/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:todo_app/modules/done_tasks/done_tasks_screen.dart';
import 'package:todo_app/modules/new_tasks/new_tasks_screen.dart';
import 'package:todo_app/tr2/local_keys.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());

  // objects mn nfsy
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  late Database database;
  late Database database2;
  late Database databaseGoals;
  late Database database3;

  String dropdownvalue = LocaleKeys.dailytask2.tr();
  String dropdownvalue2 = LocaleKeys.today.tr();

  var items = [
    LocaleKeys.sixtasks.tr(),
    LocaleKeys.twelvetask.tr(),
    LocaleKeys.dailytask2.tr(),
    LocaleKeys.weektask2.tr(),
    LocaleKeys.monthtask2.tr(),
    LocaleKeys.yeartask2.tr(),
  ];

  var items2 = [
    LocaleKeys.today.tr(),
    LocaleKeys.late.tr(),
    LocaleKeys.tomorrow.tr(),
    LocaleKeys.later.tr(),
  ];

  List<Widget> screens = [
    NewTasksScreen(),
    const DoneTasksScreen(),
    ArchivedTasksScreen(),
  //  ShowGoalsScreen()
  ];
  List<Map> newTasks = [];
  List<Map> moreTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  List<Map> sixTasks = [];
  List<Map> twelveTasks = [];

  List<Map> dailyTasks = [];
  List<Map> weeklyTasks = [];
  List<Map> monthlyTasks = [];
  List<Map> yearTasks = [];

  List<String> titles = [
    LocaleKeys.tasks3.tr(),
    LocaleKeys.done.tr(),
    LocaleKeys.archived.tr()
  ];

  bool isBottomSheetShown = false;

  IconData fabIcon = Icons.edit;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  void createDataBase() async {
    database = await openDatabase('todo.db', version: 3,
        onCreate: (database, version) {
      print("database created");
      database
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, des TEXT, date TEXT, time TEXT, status TEXT, endDate TEXT, endTime TEXT,cat TEXT,cat2 TEXT)')
          .then((value) {
        print("table created");
      }).catchError((e) {
        print("error${e.toString()}");
      });
    }, onOpen: (database) {
      //    getDataFromDataBase(database);
      print("database opened");
    }).then((value) {
      database = value;
      // if(database==null || database ==[]){
      //   emit(ShowPopUpMenu());
      // }
      emit(ShowPopUpMenu());
      emit(CreateDataBaseState());
      return database;
    });
  }

  void createDataBaseGoals() async {
    print("GOAL HEREEEEEEEEEEEE");
    databaseGoals = await openDatabase('todo2.db', version: 3,
        onCreate: (database, version) {
      // ignore: avoid_print
      print("Goals db created");
      database
          .execute(
              'CREATE TABLE Goals (id INTEGER PRIMARY KEY, goal TEXT, notes TEXT, cat TEXT)')
          .then((value) {
        print("goals table created");
      }).catchError((e) {
        print("errorGoals==============${e.toString()}");
      });
    }, onOpen: (database) {
      //    getDataFromDataBase(database);
      print("gOALS  opened");
    }).then((value) {
      databaseGoals = value;
      emit(CreateDataBaseGoalState());
      print("G==========$databaseGoals");
      return databaseGoals;
    });
  }

  void createDataBase3() async {
    database3 = await openDatabase('todo3.db', version: 3,
        onCreate: (database3, version) {
      print("database created333");
      database3
          .execute(
              'CREATE TABLE moreTasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, endTime TEXT, status TEXT,keyy TEXT)')
          .then((value) {
        print("table333333333333 created");
      }).catchError((e) {
        print("error3333333333333${e.toString()}");
      });
    }, onOpen: (database3) {
      //    getDataFromDataBase(database);
      print("database opened3333333333");
    }).then((value) {
      database3 = value;
      // if(database==null || database ==[]){
      //   emit(ShowPopUpMenu());
      // }

      emit(CreateDataBaseState3());
      return database3;
    });
  }

  insertToDataBase(String title, String des, String date, String time,
      String endDate, String endTime, String cat, String cat2) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO tasks (title,des,date,time,status,endDate,endTime,cat,cat2)'
              ' VALUES ("$title","$des","$date","$time","new","$endDate","$endTime","$cat","$cat2")')
          .then((value) {
        print("value inserted successfully$value");
        emit(InsertToDataBase());

        ///getDataFromDataBase(database);

        //     .then((value) {
        //   tasks=value;
        //   print(tasks.toString());
        //   emit(GetDataBaseState());
        // });
      });
    });
  }

  insertToDataBase3(String title, String time, String endTime, String status,
      String keyy) async {
    await database3.transaction((txn) {
      return txn
          .rawInsert('INSERT INTO moreTasks (title,time,endTime,status,keyy)'
              ' VALUES ("$title","$time","$endTime","$status","$keyy")')
          .then((value) {
        print("value inserted successfully3333$value");
        emit(InsertToDataBase3());

        ///getDataFromDataBase(database);

        //     .then((value) {
        //   tasks=value;
        //   print(tasks.toString());
        //   emit(GetDataBaseState());
        // });
      });
    });
  }

  insertGoalsToDataBase(String goal, String notes, String cat) async {
    try {
      await databaseGoals.transaction((txn) {
        return txn
            .rawInsert('INSERT INTO Goals (goal,notes,cat)'
                ' VALUES ("$goal","$notes","$cat")')
            .then((value) {
          // ignore: avoid_print
          print("value inserted successfully$value");
          emit(InsertGoalsToDataBase());
        });
      });
    } catch (e) {
      print(e);
      emit(InsertGoalsErrorState());
    }
  }

  void getDataFromDataBase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

    emit(GetDataBaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
          // newTasks=value;
        }

        if (element['status'] == 'Done') {
          doneTasks.add(element);
        }

        if (element['status'] == 'Archived') {
          archivedTasks.add(element);
        }

        if (element['cat'] == 'مهام 6 ساعات' ||
            element['cat'] == '6 hours tasks') {
          sixTasks.add(element);
          // newTasks=value;
        }
        if (element['cat'] == 'مهام 12 ساعة' ||
            element['cat'] == '12 hours tasks') {
          twelveTasks.add(element);
          // newTasks=value;
        }
        if (element['cat'] == 'مهام يومية' || element['cat'] == 'daily tasks') {
          dailyTasks.add(element);
          // newTasks=value;
        }
        if (element['cat'] == 'مهام اسبوعية' ||
            element['cat'] == ['week tasks']) {
          weeklyTasks.add(element);
          // newTasks=value;
        }
        if (element['cat'] == 'مهام شهرية' || element['cat'] == 'month tasks') {
          monthlyTasks.add(element);
          // newTasks=value;
        }
        if (element['cat'] == 'مهام سنوية' || element['cat'] == 'year tasks') {
          yearTasks.add(element);
          // newTasks=value;
        }
      });
      print(newTasks.toString());
      print(doneTasks.toString());
      print(archivedTasks.toString());
      emit(GetDataBaseState());
    });
  }

  void getDataFromDataBase3(database3) {
    moreTasks = [];

    emit(GetDataBase3LoadingState());

    database3.rawQuery('SELECT * FROM moreTasks').then((value) {
      value.forEach((element) {
        moreTasks.add(element);
      });

      emit(GetDataBase3State());
    });
  }

  void getGoalsFromDataBase() {
    print("GOOOOALLLSSS");
    List<Map> dailyTasks = [];
    List<Map> weeklyTasks = [];
    List<Map> monthlyTasks = [];
    List<Map> yearTasks = [];
    List<Map> goals = [];
    emit(GetDataBase3LoadingState());

    database3.rawQuery('SELECT * FROM  Goals').then((value) {
      value.forEach((element) {
        goals.add(element);
        if (element['cat'] == 'day') {
          dailyTasks.add(element);
        }

        if (element['cat'] == 'week') {
          weeklyTasks.add(element);
        }
        if (element['cat'] == 'month') {
          monthlyTasks.add(element);
        }

        if (element['cat'] == 'year') {
          yearTasks.add(element);
        }
      });

      emit(GetGoalsState());
    });
  }

  void changeBottomeSheet({required bool isShown, required IconData icon}) {
    isBottomSheetShown = isShown;
    fabIcon = icon;
    emit(ChangeBottomSheet());
  }

  void updateData({required String status, required int id}) async {
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?', [status, id]).then((value) {
      getDataFromDataBase(database);
      emit(UpdateDataBaseState());
    });
  }

  updateData3({required String status, required int id}) async {
    database3.rawUpdate('UPDATE moreTasks SET status = ? WHERE id = ?',
        [status, id]).then((value) {
      getDataFromDataBase3(database3);
      emit(UpdateDataBaseState3());
    });
  }

  // String title,String des, String date,
  //     String time,String endDate,String endTime,String cat)

  void editData(
      {required String title,
      required String des,
      required String date,
      required String time,
      required String endTime,
      required String endDate,
      required String cat,
      required String cat2,
      required int id}) async {
    // int count = await database.rawUpdate(
    //     'UPDATE Test SET name = ?, value = ? WHERE name = ?',
    //     ['updated name', '9876', 'some name']);
    // print('updated: $count');

    database.rawUpdate(
        'UPDATE tasks SET title = ?, des = ?, date = ?, time = ?, endTime = ?, endDate = ?, cat = ?, cat2 = ? WHERE id = ?',
        [
          '$title',
          '$des',
          '$date',
          '$time',
          '$endTime',
          '$endDate',
          '$cat',
          '$cat2',
          id
        ]).then((value) {
      emit(EditDataBaseState());
      getDataFromDataBase(database);
    });
  }

  void deleteData({required int id}) async {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDataBase(database);
      emit(DeleteDataBaseState());
    });
  }

  void changeLang() {

    emit(ChangeLangState());
  }
}
