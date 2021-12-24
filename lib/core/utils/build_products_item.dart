import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constant/shared_color.dart';
import 'package:flutter_task/core/utils/card_shadow.dart';
import 'package:flutter_task/features/home/controller/cubit.dart';
import 'package:flutter_task/features/home/controller/states.dart';
import 'package:flutter_task/features/home/model/product_model.dart';
import 'package:flutter_task/features/product_details/view/product_details.dart';

class BuildProducts extends StatelessWidget {
  const BuildProducts({Key? key, required this.product, required this.index})
      : super(key: key);
  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.h),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                color: Colors.grey[300],
                boxShadow: getCardShadow),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: CachedNetworkImage(
                    imageUrl: '${product.products[index].imageUrl}',
                    height: double.infinity,
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                      color: mainColor,
                    )),
                    // errorWidget: (context, url, error) => const Center(
                    //     child: CircularProgressIndicator(
                    //       color: mainColor,
                    //     )),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Name: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: mainColor),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '${product.products[index].name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 15.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Price: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: mainColor),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '${product.products[index].price}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Rating:',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: mainColor),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            RatingBar.builder(
                                itemSize: 15.0,
                                initialRating:
                                    product.products[index].rate! / 2,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0.h),
                                itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.yellow[500],
                                    ),
                                onRatingUpdate: (rating) {})
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Market: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: mainColor),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '${product.products[index].market!.name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 13.sp),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  onPressed: () async {
                                    cubit.addTransactios(
                                        product.products[index].name!,
                                        product.products[index].price!,
                                        product.products[index].rate!,
                                        product.products[index].description!,
                                        product.products[index].imageUrl!,
                                        product.products[index].market!.name!,
                                        product
                                            .products[index].market!.address!);
                                  },
                                  child: const CircleAvatar(
                                    child:
                                        Icon(Icons.add_shopping_cart_outlined),
                                  )),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductsDetails(
                                                    name: product
                                                        .products[index].name!,
                                                    price: product
                                                        .products[index].price!,
                                                    rate: product
                                                        .products[index].rate!,
                                                    description: product
                                                        .products[index]
                                                        .description!,
                                                    imageUrl: product
                                                        .products[index]
                                                        .imageUrl!,
                                                    nameMarket: product
                                                        .products[index]
                                                        .market!
                                                        .name!,
                                                    address: product
                                                        .products[index]
                                                        .market!
                                                        .address!)));
                                  },
                                  child: Text(
                                    'SeeMore',
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: mainColor),
                                  )),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
