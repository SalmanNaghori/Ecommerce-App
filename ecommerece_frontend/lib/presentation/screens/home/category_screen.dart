import 'package:ecommerece_frontend/logic/cubit/category_cubit/category_cubit.dart';
import 'package:ecommerece_frontend/logic/cubit/category_cubit/category_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoadingState && state.categories.isEmpty) {
          return Center(
            child: CupertinoActivityIndicator(
              radius: 20,
            ),
          );
        } else if (state is CategoryErorrState && state.categories.isEmpty) {
          return Center(
            child: Text(state.message.toString()),
          );
        }

        return ListView.builder(
          itemCount: state.categories.length,
          shrinkWrap: true,
          itemBuilder: (ctx, i) {
            final category = state.categories[i];
            return ListTile(
              onTap: () {},
              leading: const Icon(CupertinoIcons.book_circle),
              title: Text(" ${category.title}"),
              trailing: Icon(CupertinoIcons.right_chevron),
            );
          },
        );
      },
    );
  }
}
