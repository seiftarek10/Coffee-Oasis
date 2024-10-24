import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Features/Owner/Data/Repos/owner_repo_impl.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/add_coffee_drink_use_case.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/add_coffee/add_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/Bloc%20Widgets/add_coffee_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFloatingActionButton extends StatelessWidget {
  const AddFloatingActionButton({
    super.key, required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => AddCoffeeDrinkCubit(
                      AddCoffeeDrinkUseCase(getIt.get<OwnerRepoImpl>())),
                  child:  AddCoffeeBlocListner(
                    id: id,
                  ),
                );
              });
        },
        backgroundColor: AppColors.kPrimaryColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
