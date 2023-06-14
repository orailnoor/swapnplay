import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swapnplay/Controllers/loginController.dart';
import 'package:swapnplay/UI/Constants/colors.dart';
import 'package:swapnplay/UI/Screens/otpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Obx(() => InkWell(
            onTap: () {
              if (loginController.mobileNumberText.text.length == 10) {
                Get.to(() => const OtpScreen());
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: Get.width - 32,
              height: 50,
              decoration: BoxDecoration(
                  color: loginController.isComplete.value
                      ? AppColor.darkColor
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                'Continue',
                style: GoogleFonts.ubuntu(
                  color: Colors.white.withOpacity(.9),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * .2,
              ),
              Text(
                'Enter your\nmobile number',
                style: GoogleFonts.ubuntu(
                  color: AppColor.darkColor,
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'we will send you a confirmation code',
                style: GoogleFonts.ubuntu(
                  color: AppColor.darkColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                      width: (Get.width * .2) - 20,
                      child: Text(
                        '+91',
                        style: GoogleFonts.ubuntu(
                          color: AppColor.darkColor.withOpacity(.9),
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: (Get.width * .8) - 20,
                      child:
                       TextField(
                        onChanged: (v) {
                          if (v.length == 10) {
                            loginController.isComplete.value = true;
                          } else {
                            loginController.isComplete.value = false;
                          }
                        },
                        controller: loginController.mobileNumberText,
                        style: GoogleFonts.ubuntu(
                          color: AppColor.darkColor.withOpacity(.9),
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                        ),
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            hintText: '70555 50123',
                            hintStyle: GoogleFonts.ubuntu(
                              color: AppColor.darkColor.withOpacity(.5),
                              fontSize: 26,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'By tapping "Continue", you agree to our Privacy\nand Policy and Term of Services',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              )
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';
// import 'package:glass/glass.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:swapnplay/Controllers/loginController.dart';
// import 'package:swapnplay/UI/Constants/colors.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   LoginController loginController = Get.put(LoginController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       floatingActionButton: Obx(() => Container(
//                 alignment: Alignment.center,
//                 width: Get.width - 32,
//                 height: 50,
//                 child: Text(
//                   'Continue',
//                   style: GoogleFonts.ubuntu(
//                     color: Colors.white.withOpacity(.9),
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                     color: loginController.isComplete.value
//                         ? AppColor.darkColor
//                         : Colors.grey,
//                     borderRadius: BorderRadius.circular(20)),
//               )

//           // FloatingActionButton(
//           //   backgroundColor:
//           // loginController.isComplete.value
//           //       ? AppColor.darkColor
//           //       : Colors.grey,
//           //   onPressed: () {},
//           //   child: const Icon(Icons.chevron_right),
//           // ),
//           ),
//       body: SizedBox(
//         height: Get.height,
//         width: Get.width,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: Get.height * .1,
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 child: Text(
//                   'SwapnPlay.',
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.ubuntu(
//                     color: AppColor.darkColor,
//                     fontSize: 21,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 child: Text(
//                   'Create your account using your phone\nnumber',
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.ubuntu(
//                     color: AppColor.darkColor,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Container(
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 35,
//                       width: (Get.width * .2) - 20,
//                       child: Text(
//                         '+91',
//                         style: GoogleFonts.ubuntu(
//                           color: AppColor.darkColor.withOpacity(.9),
//                           fontSize: 26,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 50,
//                       width: (Get.width * .8) - 20,
//                       child: TextField(
//                         onChanged: (v) {
//                           if (v.length == 10) {
//                             loginController.isComplete.value = true;
//                           } else {
//                             loginController.isComplete.value = false;
//                           }
//                         },
//                         controller: loginController.mobileNumberText,
//                         style: GoogleFonts.ubuntu(
//                           color: AppColor.darkColor.withOpacity(.9),
//                           fontSize: 26,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         keyboardType: TextInputType.phone,
//                         maxLength: 10,
//                         decoration: InputDecoration(
//                             counterText: '',
//                             border: InputBorder.none,
//                             hintText: '0000000000',
//                             hintStyle: GoogleFonts.ubuntu(
//                               color: AppColor.darkColor.withOpacity(.5),
//                               fontSize: 26,
//                               fontWeight: FontWeight.w400,
//                             )),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
