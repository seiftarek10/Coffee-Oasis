import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';

class DialogEditBody extends StatelessWidget {
  const DialogEditBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 170,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  image:
                      DecorationImage(image: AssetImage(Assets.imagesBackground)),
                  shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}
