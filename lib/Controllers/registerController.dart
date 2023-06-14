import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  RxBool isEmail = false.obs;
  RxBool isLocation = false.obs;
  RxBool isPrefrence = false.obs;
  void validateForm() {
    if (emailController.text.isEmpty) {
      isEmail.value = true;
    } else {
      isEmail.value = false;
    }
    if (addressController.text.isEmpty) {
      isLocation.value = true;
    } else {
      isLocation.value = false;
    }
  }

  // RxString selectedGender = ''.obs;
  RxString selectedAddress = ''.obs;
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxString imagePath = ''.obs;
  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    imagePath.value = image!.path;
  }
}
