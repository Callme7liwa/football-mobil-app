import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';


class SortingController extends GetxController {


  List<String> cities = [
    'New York',
    'London',
    'Paris',
    'Tokyo',
    'Berlin',
    'Rome',
    'Sydney',
  ];

  List<dynamic> selectedCities = [];
  var selectedCitiesValue = ''.obs;

  void onInit() {
    super.onInit();
  }

  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void showMultiSelect() async {
    await showDialog(
        context: Get.context!,
        builder: (ctx) {
          return MultiSelectDialog(
            listType: MultiSelectListType.LIST,
            initialValue: selectedCities,
            items: cities
                .map((city) => MultiSelectItem<String>(city, city.toLowerCase()))
                .toList(),
            title: Text("cities"),
            selectedColor: Colors.blue,
            searchable: true,
            onConfirm: (results) {
              selectedCities = results;
              selectedCitiesValue.value = "";
              selectedCities.forEach((element) {
                selectedCitiesValue.value =
                    selectedCitiesValue.value + " " + element.name;
              });
            },
          );
        });
  }
}