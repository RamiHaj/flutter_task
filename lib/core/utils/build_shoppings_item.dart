import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constant/shared_color.dart';
import 'package:flutter_task/features/home/controller/cubit.dart';
import 'package:flutter_task/features/home/controller/states.dart';
import 'package:flutter_task/features/home/model/transaction.dart';
import 'package:flutter_task/features/product_details/view/product_details.dart';

import 'card_shadow.dart';

class BuildShoppingsItem extends StatelessWidget {
  const BuildShoppingsItem({Key? key, required this.transaction, required this.index}) : super(key: key);
  final List<Transaction> transaction;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit , HomeStates>(
      listener: (context , state){},
      builder: (context , state){
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
                    imageUrl: transaction[index].imageUrl,
                    // fit: BoxFit.cover,
                    height: double.infinity,
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        )),
                    errorWidget: (context, url, error) => const Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        )),
                  ),
                ),
                SizedBox(
                  width: 8.w,
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
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: mainColor
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              transaction[index].name,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 15.sp
                              ),
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
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: mainColor
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '${transaction[index].price}',
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
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: mainColor
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            RatingBar.builder(
                                itemSize: 15.0,
                                initialRating: transaction[index].rate / 2,
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
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: mainColor
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              transaction[index].nameMarket,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 13.sp
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  onPressed: ()
                                  {
                                    cubit.deleteTransactions(transaction[index]);
                                  },
                                  child: const CircleAvatar(
                                    child: Icon(Icons.remove_shopping_cart_outlined),
                                  )),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            ProductsDetails(
                                                name: transaction[index].name,
                                                price: transaction[index].price,
                                                rate: transaction[index].rate,
                                                description: transaction[index].description,
                                                imageUrl: transaction[index].imageUrl,
                                                nameMarket: transaction[index].nameMarket,
                                                address: transaction[index].address
                                            ))
                                    );
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
