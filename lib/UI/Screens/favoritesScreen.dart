import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swapnplay/UI/Constants/colors.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: kToolbarHeight,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            alignment: Alignment.topCenter,
            child: Text(
              'Favorites',
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu(
                  color: AppColor.darkColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.amber,
              alignment: Alignment.topCenter,
            ))
      ],
    ));
  }
}
