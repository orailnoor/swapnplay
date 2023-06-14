import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';

class PostGameController extends GetxController {
  List<Media>? pickedImages = [];
  int? coverPhoto = 1;
  Future getImage() async {
    List<Media>? res = await ImagesPicker.pick(
      gif: false,
      count: pickedImages!.isEmpty ? 6 : 6 - pickedImages!.length,
      pickType: PickType.image,
    );
    if (res != null) {
      pickedImages!.addAll(res);
      print(res.map((e) => e.path).toList());
    }
    update();
  }
}
