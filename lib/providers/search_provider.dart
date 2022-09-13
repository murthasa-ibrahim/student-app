import 'package:flutter/cupertino.dart';
import 'package:getx_student_app/models/hive_model.dart';
import 'package:getx_student_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  final BuildContext context;
  SearchProvider(this.context);
  TextEditingController searchController = TextEditingController();

  // Search list
  List<StudentModel> tempList = [];

  // search function

  void filterSearch(String? value) {
    if (value == null || value.isEmpty) {
      tempList.clear();
      tempList.addAll(context.read<HomeProvider>().studentList);
      notifyListeners();
    } else {
      tempList.clear();
      for (var i in context.read<HomeProvider>().studentList) {
        if (i.name.toLowerCase().startsWith(value.toLowerCase())) {
          tempList.add(i);
        }
      }
      notifyListeners();
    }
    
  }
}
