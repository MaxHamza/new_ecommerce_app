import 'package:eb_tech_task/core/share/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../main.dart';
import '../../data/models/product_model.dart';
import '../manager/fetch_products/cubit.dart';
import '../manager/insert_product/cubit.dart';
import '../manager/insert_product/state.dart';

class InsertProduct extends StatefulWidget {
  const InsertProduct({super.key});
  @override
  State<InsertProduct> createState() => _InsertProductState();
}

class _InsertProductState extends State<InsertProduct> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  final imageController = TextEditingController();
  String? selectedCategory;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    for (var c in [nameController, priceController, descController, imageController]) { c.dispose(); }
    super.dispose();
  }

  void _submitData() async {
    if (!formKey.currentState!.validate() || selectedCategory == null) {
      if (selectedCategory == null) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Select category")));
      return;
    }

    final  product = await context.read<InsertProductCubit>().addProduct(
      title: nameController.text,
      price: double.parse(priceController.text),
      description: descController.text,
      category: selectedCategory!,
      image: imageController.text,
    );

    if (mounted) {
      context.read<ProductCubit>().addLocalProduct(product);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Product added successfully")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: BlocConsumer<InsertProductCubit, InsertProductState>(
          listener: (context, state) {
            if (state is InsertProductError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: ListView(
                children: [
                  _buildHeader(),
                  _buildLabel("IMAGE URL"),
                  _buildTextField(imageController, "https://image-url.com"),
                  _buildLabel("PRODUCT NAME"),
                  _buildTextField(nameController, "Product name"),
                  _buildLabel("CATEGORY"),
                  _buildDropdown(),
                  _buildLabel("PRICE"),
                  _buildTextField(priceController, "0.00", isNumber: true),
                  _buildLabel("DESCRIPTION"),
                  _buildTextField(descController, "Description", maxLines: 5),
                  Gap(20.h),
                  CustomButton(
                    height: 53.h,
                    title: state is InsertProductLoading ? 'Loading...' : 'Save Product',
                    onTap: state is InsertProductLoading ? null : _submitData,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // --- Helper Widgets ---
  Widget _buildHeader() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('New Product', style: getBoldStyle(color: ColorManager.secondaryText, fontSize: 25.sp)),
      Gap(10.h),
      Text('Add a new item to your collection.', style: getRegularStyle(color: ColorManager.primaryText, fontSize: 16.sp)),
      Gap(10.h),
    ],
  );

  Widget _buildLabel(String text) => Padding(
    padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
    child: Text(text, style: TextStyle(color: ColorManager.secondaryText, fontWeight: FontWeight.bold)),
  );

  Widget _buildTextField(TextEditingController controller, String hint, {int maxLines = 1, bool isNumber = false}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
      decoration: InputDecoration(
        hintText: hint, filled: true, fillColor: const Color(0xffFFD2CF),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildDropdown() => Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w),
    decoration: BoxDecoration(color: const Color(0xffFFD2CF), borderRadius: BorderRadius.circular(12.r)),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedCategory,
        hint: const Text("Select category"),
        isExpanded: true,
        items: ["men's clothing", "women's clothing", "jewelery", "electronics"]
            .map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
        onChanged: (v) => setState(() => selectedCategory = v),
      ),
    ),
  );
}