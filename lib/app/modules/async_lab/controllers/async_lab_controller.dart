import 'package:get/get.dart';

class AsyncLabController extends GetxController {
  //TODO: Implement AsyncLabController

  var result = ''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<String> fetchData() {
    return Future.delayed(
      Duration(seconds: 5),
      () => "Data Loaded Successfully",
    );
   }
//    Stream<int> counterStream() {
//   return Stream.periodic(
//     Duration(seconds: 1),
//     (count) => count,
//   );
// }

   Future<void> loadData() async {
  result.value = "Loading...";
  var data = await fetchData();
  result.value = data;
}

  }
