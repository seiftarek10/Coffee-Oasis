import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Features/Owner/Data/Repos/owner_repo_impl.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/update_coffee_drink_use_case.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/delete_coffee_drink/delete_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_category_coffee_drinks.dart/get_category_coffee_drinks_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/update_coffee_drink/update_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/Bloc%20Widgets/delete_coffee_drink_bloc_listner.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/Bloc%20Widgets/upadate_coffee_drink_bloc_listner.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/coffee_drink_item.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/swap_note.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/slide_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeDrinksListView extends StatelessWidget {
  const CoffeeDrinksListView(
      {super.key, required this.coffeeDrinks, required this.id, required this.getCategoryCoffeeDrinksCubit});
  final List<CoffeeEntity> coffeeDrinks;
  final String id;
  final GetCategoryCoffeeDrinksCubit getCategoryCoffeeDrinksCubit;
  @override
  Widget build(BuildContext context) {
    return DeleteCoffeeDrinkBlocListner(
        id: id,
        child: Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Space.k24,
          const SwapNote(),
          Space.k24,
          Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: coffeeDrinks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SlideCard(
                            delete: () async {
                              await context
                                  .read<DeleteCoffeeDrinkCubit>()
                                  .deleteCoffeeDrink(
                                      parentDocId: id,
                                      docId: coffeeDrinks[index].id!,
                                      photoUrl: coffeeDrinks[index].photo!,
                                      );
                            },
                            update: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return MultiBlocProvider(
                                        providers: [
                                          BlocProvider(
                                              create: (context) =>
                                                  UpdateCoffeeDrinkCubit(
                                                      UpdateCoffeeDrinkUseCase(
                                                          getIt.get<
                                                              OwnerRepoImpl>()))),
                                          BlocProvider.value(value: getCategoryCoffeeDrinksCubit)
                                        ],
                                        child: UpadateCoffeeDrinkBlocListner(
                                          coffeeEntity: coffeeDrinks[index],
                                          id: id,
                                        ));
                                  });
                            },
                            itemKey: Key(index.toString()),
                            child: CoffeeDrinkItem(
                                coffeeEntity: coffeeDrinks[index])));
                  }))
        ])));
  }
}
