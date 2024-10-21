import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/NetWork/database_services.dart';
import 'package:coffee_oasis/Features/Owner/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/Owner/Data/Repos/owner_repo_impl.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/add_category_use_case.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/add_category/add_category_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Bloc%20Widgets/add_category_bloc_listner.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/coffee_photo_buttton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageCategoryForm extends StatelessWidget {
  const ManageCategoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AddCategoryCubit(AddCategorUseCase(ownerRepo: OwnerRepoImpl(OwnerRemoteDataSource(
        DatabaseServices()
      )))),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.7),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Space.topPageSpace,
                const CoffeeDtrinkPhoto(),
                Space.topPageSpace,
               const AddCategoryBlocListner(),    
                Space.bottomSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}
