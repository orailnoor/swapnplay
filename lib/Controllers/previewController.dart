import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:swapnplay/LocalDatabase/databaseHelper.dart';

class PreviewController extends GetxController {
  final dbHelper = DatabaseHelper();

  void fetch() async {
    final dbHelper = DatabaseHelper();

    List<Map<String, dynamic>> urls = await dbHelper.getGames();
    urls.forEach((url) {
      print(
          'ID: ${url['id']}, Name: ${url['name']}, Desc: ${url['desc']}, URL: ${url['urls']}');
    });
  }

  void insert({String? name, desc, url}) async {
    Map<String, dynamic> Game = {
      'id': '1100',
      'name': 'Flutter',
      'desc': 'Flutter homepage',
      'urls': 'https://flutter.dev/'
    };
    try {
      await dbHelper.insertGame(Game);
      Fluttertoast.showToast(msg: 'Added to Favourites');
    } catch (e) {
      print(e);
    }
  }

  RxBool isFull = false.obs;
}
