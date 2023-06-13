import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerece_frontend/core/ui.dart';
import 'package:ecommerece_frontend/logic/cubit/product_cubit/product_cubit.dart';
import 'package:ecommerece_frontend/logic/cubit/product_cubit/product_state.dart';
import 'package:ecommerece_frontend/logic/services/formatter.dart';
import 'package:ecommerece_frontend/presentation/widget/gap_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserFeedScreen extends StatefulWidget {
  const UserFeedScreen({super.key});

  @override
  State<UserFeedScreen> createState() => _UserFeedScreenState();
}

class _UserFeedScreenState extends State<UserFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState && state.products.isEmpty) {
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 25,
            ),
          );
        }

        if (state is ProductErrorState && state.products.isEmpty) {
          return Center(child: Text(state.message ?? ""));
        }
        return ListView.separated(
          itemCount: state.products.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (ctx, i) {
            final product = state.products[i];
            return Column(children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15)),
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width / 3,
                          imageUrl: "${product.image?[0]}",
                        ),
                      ),
                      const GapWidget(size: 12),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${product.title}",
                              style: TextStyles.body1.copyWith(
                                color: AppColors.text,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "${product.description}",
                              style: TextStyles.body2.copyWith(
                                color: AppColors.textLight,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const GapWidget(),
                            Text(
                              "₹\ ${Formatter.fromatterPrice(product.price!)}",
                              style: TextStyles.heading3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ]);
          },
        );
      },
    );
  }
}
