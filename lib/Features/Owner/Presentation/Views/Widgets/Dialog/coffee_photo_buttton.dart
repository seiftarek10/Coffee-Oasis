import 'dart:io';
import 'package:coffee_oasis/Core/Helpers/image_picker_service.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CoffeeDtrinkPhoto extends StatefulWidget {
  const CoffeeDtrinkPhoto({
    super.key,
    required this.pickedPhoto,
    this.photourl,
  });

  final ValueChanged<File>? pickedPhoto;
  final String? photourl;

  @override
  State<CoffeeDtrinkPhoto> createState() => _CoffeeDtrinkPhotoState();
}

class _CoffeeDtrinkPhotoState extends State<CoffeeDtrinkPhoto> {
  File? photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: (photo == null && widget.photourl == null)
                  ? const AssetImage(Assets.imagesCoffeePlaceholder)
                  : photo != null
                      ? FileImage(photo!)
                      : widget.photourl != null
                          ? NetworkImage(widget.photourl!)
                          : const AssetImage(Assets.imagesCoffeePlaceholder)),
          shape: BoxShape.circle),
      child: Align(
          alignment: Alignment(0.3.w, 1),
          child: IconButton(
              onPressed: () async {
                photo = await ImagePickerService(picker: ImagePicker())
                    .pickImage(source: ImageSource.gallery);
                if (photo != null) {
                  widget.pickedPhoto!(photo!);
                }

                setState(() {});
              },
              icon: const Icon(Icons.add_a_photo,
                  color: AppColors.kPrimaryColor, size: 40))),
    );
  }
}
