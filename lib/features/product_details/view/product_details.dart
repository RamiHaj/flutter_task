import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constant/shared_color.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({Key? key, required this.name, required this.price, required this.rate, required this.description, required this.imageUrl, required this.nameMarket, required this.address}) : super(key: key);
  final String name;
  final int price;
  final double rate;
  final String description;
  final String imageUrl;
  final String nameMarket;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: mainColor
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.h , vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height/4,
              placeholder: (context , url) => const Center(child: CircularProgressIndicator(color: mainColor,)),
              errorWidget: (context , url , error) => const Center(child: CircularProgressIndicator(color: mainColor,)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 20.w),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Divider(
                  height: 2.h,
                  color: mainColor,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Price: $price',
                    style: const TextStyle(
                        fontSize: 20,
                        color: mainColor
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: TextButton(
                      onPressed: () {},
                      child: const CircleAvatar(
                        child: Icon(Icons.add_shopping_cart_outlined),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Description: ',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: mainColor
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 15.sp
              ),
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
                    initialRating: rate / 2,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Name Market: ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: mainColor
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  nameMarket,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Address Market: ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: mainColor
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  address,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15.sp
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
