import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Counter',style: Fonts.font20_700.copyWith()),
             Row(
              crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(EvaIcons.minusCircle,color: AppColors.kPrimaryColor,)),
                    Text('1',style: Fonts.font20_700),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.add_circle_outlined,color: AppColors.kPrimaryColor,)),

                    
                  ],
                )
      ],
    );
  }
}