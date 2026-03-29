import 'dart:io';

import 'package:eb_tech_task/core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../main.dart';
import '../manager/cart/cubit.dart';
import '../manager/cart/state.dart';
import '../widgets/cart/cart_item.dart';
import '../widgets/cart/price_card.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

@override
  void initState() {
      context.read<CartCubit>().loadCart();
    super.initState();
  }
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(16.r),
      color: ColorManager.primary,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartSuccess) {
            return ListView(
              children: [
                Text('Your Bag'),

                Gap(10.h),

                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return ListTile(
                      isThreeLine: true,
                      leading: item.image.startsWith('http')
                          ? Image.network(
                        item.image,
                        width: 50.w,
                        height: 50.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _buildErrorImage();
                        },
                      )
                          : Image.file(
                        File(item.image),
                        width: 50.w,
                        height: 50.h,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item.title),
                      subtitle: Row(
                        children: [
                          Text('x${item.quantity}',style: TextStyle(fontSize: 14.sp),),
                           Spacer(),
                           Text('\$${item.price}',style: TextStyle(fontSize: 14.sp),),
                        ],
                      ),
                      trailing: IconButton(onPressed: (){
                        context.read<CartCubit>().removeItem(index);
                      }, icon: Icon(Icons.close,size: 22.r,)),
                    );
                  },
                  separatorBuilder: (_, __) => Gap(10.h),
                ),

                Gap(20.h),

                PriceCard(price: state.total),
              ],
            );
          }

          return Center(child: Text('Cart is empty'));
        },
      ),
    );
  }
Widget _buildErrorImage() {
  return Container(
    width: 50.w,
    height: 50.h,
    color: Colors.grey.shade200,
    child: Icon(
      Icons.image_not_supported,
      size: 20.r,
      color: Colors.grey,
    ),
  );
}
}