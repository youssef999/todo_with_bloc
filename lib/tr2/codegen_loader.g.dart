// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "hello": "مرحبا",
  "RBCs": "فريق الكريات الحمراء",
  "PLEASEENTERTitle": "ادخل العنوان ",
  "title": "ادخل العنوان",
  "time": "التوقيت",
  "entertime": "ادخل الوقت ",
  "date": "التاريخ",
  "enterDate": "ادخل التاريخ",
  "tasks": "جميع المهام",
  "tasks2": "المهام",
  "done": "مهام تم تنفيذها",
  "archived": "الارشيف",
  "changeLang": "تغير اللغة",
  "notask": "لا توجد مهام جديدة .. قم باضافة مهمة جديدة",
  "sixtask": "مهام 6 ساعات",
  "twelvetask": "مهام 12 ساعة",
  "dailytask": "مهام يومية",
  "weektask": "مهام اسبوعية",
  "monthtask": "مهام شهرية",
  "yeartask": "مهام سنوية",
  "edit": "تعديل",
  "cancel": "الغاء التعديل",
  "ptitle": "تطبيق المهام",
  "pdes": "اهلا بك يمكنك الان اضافة العديد من المهام الجديدة ",
  "ok": "حسنا ",
  "enterdes": "ادخل التفاصيل",
  "timeend": "توقيت نهاية المهمة",
  "dateend": "تاريخ انتهاء المهمة",
  "des": "تفاصيل عن المهمة",
  "hours": "ساعات",
  "min": "دقائق",
  "sec": "ثواني"
};
static const Map<String,dynamic> en = {
  "hello": "hello222",
  "RBCs": "red",
  "PLEASEENTERTitle": "PLEASE ENTER Title",
  "title": "Title",
  "des": "description",
  "enterdes": "Enter description",
  "time": "Time",
  "entertime": "Enter the time ",
  "date": "Date",
  "sixtask": "6 hours tasks",
  "twelvetask": "12 hours tasks",
  "dailytask": "daily tasks",
  "weektask": "week tasks",
  "monthtask": "month tasks",
  "yeartask": "year tasks",
  "edit": "edit",
  "cancel": "cancel",
  "enterDate": "Enter Date",
  "tasks": "All Tasks",
  "done": "Done Tasks",
  "archived": "Archived",
  "notask": "No New Tasks yet ,add some tasks",
  "changeLang": "change Language",
  "ptitle": "Todo List",
  "pdes": "Welcome to our app , enjoy adding new tasks",
  "ok": "ok",
  "timeend": "Time to End the task",
  "dateend": "Date to End the task",
  "tasks2": "Tasks",
  "hours": "Hours",
  "min": "Minutes",
  "sec": "Seconds"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
