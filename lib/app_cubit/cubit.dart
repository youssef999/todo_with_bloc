

 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:todo_app/modules/done_tasks/done_tasks_screen.dart';
import 'package:todo_app/modules/new_tasks/new_tasks_screen.dart';
import 'package:todo_app/resources/constants_manager.dart';
import 'package:todo_app/tr2/local_keys.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppIntialState());


  // objects mn nfsy
  static AppCubit get(context) =>BlocProvider.of(context);

  int currentIndex = 0;
  late Database database;
  late Database database2;
  String dropdownvalue =   LocaleKeys.dailytask.tr();

  var items = [
  LocaleKeys.sixtasks.tr(),
  LocaleKeys.twelvetask.tr(),
  LocaleKeys.dailytask.tr(),
  LocaleKeys.weektask.tr(),
  LocaleKeys.monthtask.tr(),
  LocaleKeys.yeartask.tr(),
  ];

  List<Widget>screens = [
    NewTasksScreen(),
     const DoneTasksScreen(),
     ArchivedTasksScreen()
  ];
  List<Map>newTasks=[];
  List<Map>doneTasks=[];
  List<Map>archivedTasks=[];
  List<Map>sixTasks=[];
  List<Map>twelveTasks=[];
  List<Map>dailyTasks=[];
  List<Map>weeklyTasks=[];
  List<Map>monthlyTasks=[];
  List<Map>yearTasks=[];

  List<String>titles = [
    LocaleKeys.tasks2.tr(),
    LocaleKeys.done.tr(),
    LocaleKeys.archived.tr()
  ];

  bool isBottomSheetShown = false;

  IconData fabIcon = Icons.edit;



  void changeIndex(int index){
    currentIndex=index;
    emit(ChangeBottomNavBarState());
  }

  void createDataBase() async{
    database =  await openDatabase('todo.db',
        version: 3,
        onCreate: (database, version) {
          print("database created");
          database.execute
            (
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, des TEXT, date TEXT, time TEXT, status TEXT, endDate TEXT, endTime TEXT,cat TEXT)')
              .then((value) {
            print("table created");
          }).catchError((e) {
            print("error${e.toString()}");
          });
        },
        onOpen: (database) {
      //    getDataFromDataBase(database);
          print("database opened");
        }
    ).then((value) {

      database=value;
      // if(database==null || database ==[]){
      //   emit(ShowPopUpMenu());
      // }
      emit(ShowPopUpMenu());
      emit(CreateDataBaseState());
      return database2;

    });

  }


  insertToDataBase(String title,String des, String date,
      String time,String endDate,String endTime,String cat) async {

   await database.transaction((txn) {
      return txn.rawInsert
        (
          'INSERT INTO tasks (title,des,date,time,status,endDate,endTime,cat)'
              ' VALUES ("$title","$des","$date","$time","new","$endDate","$endTime","$cat")')
          .then((value) {
        print("value inserted successfully" + value.toString());
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

 void getDataFromDataBase(database){

    newTasks =[];
    doneTasks=[];
    archivedTasks=[];

    emit(GetDataBaseLoadingState());
     database.rawQuery('SELECT * FROM tasks').then((value) {

       value.forEach((element){

         if(element['status']=='new'){

           newTasks.add(element);
          // newTasks=value;
         }

         if(element['status']=='Done'){

           doneTasks.add(element);

         }

         if(element['status']=='Archived'){

           archivedTasks.add(element);
         }



         if(element['cat']=='مهام 6 ساعات'){

           sixTasks.add(element);
           // newTasks=value;
         }
         if(element['cat']=='مهام 12 ساعة'){

           twelveTasks.add(element);
           // newTasks=value;
         }
         if(element['cat']=='مهام يومية'){

           dailyTasks.add(element);
           // newTasks=value;
         }
         if(element['cat']=='مهام اسبوعية'){

           weeklyTasks.add(element);
           // newTasks=value;
         }
         if(element['cat']=='مهام شهرية'){

           monthlyTasks.add(element);
           // newTasks=value;
         }
         if(element['cat']=='مهام سنوية'){
           yearTasks.add(element);
           // newTasks=value;
         }
       }

       );
       print(newTasks.toString());
       print(doneTasks.toString());
       print(archivedTasks.toString());
       emit(GetDataBaseState());
     });

  }


  void changeBottomeSheet({required bool isShown , required IconData icon}) {
    isBottomSheetShown=isShown;
    fabIcon=icon;
    emit(ChangeBottomSheet());
   }

void updateData({required String status ,required int id})async{

   database.rawUpdate(
       'UPDATE tasks SET status = ? WHERE id = ?',
       ['$status', id]).then((value) {
         getDataFromDataBase(database);
         emit(UpdateDataBaseState());
   });


 }

  // String title,String des, String date,
  //     String time,String endDate,String endTime,String cat)

  void editData({required String title,required String des,required String date,
    required String time,required String endTime,required String endDate ,required int id})async{


    database.rawUpdate(
        'UPDATE tasks SET title = ?, des = ?, date = ?, time = ?, endTime = ?, endDate = ? WHERE id = ?',
        ['$title','$des','$date','$time','$endTime','$endDate', id]).then((value) {
      getDataFromDataBase(database);
      emit(EditDataBaseState());
    });

  }

  void deleteData({required int id})async {
    database.rawDelete(
        'DELETE FROM tasks WHERE id = ?',
        [ id]).then((value) {
      getDataFromDataBase(database);
      emit(DeleteDataBaseState());
    });
  }

  void changeLang(){
    emit(ChangeLangState());
  }


}