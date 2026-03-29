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
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class InsertProduct extends StatefulWidget {
  const InsertProduct({super.key});

  @override
  State<InsertProduct> createState() => _InsertProductState();
}

class _InsertProductState extends State<InsertProduct> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();

  String? selectedCategory;
  final formKey = GlobalKey<FormState>();

  File? selectedImage;
  final ImagePicker picker = ImagePicker();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descController.dispose();
    super.dispose();
  }

  //Select Image
  Future<void> pickImage() async {
    final XFile? image =
    await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  void _submitData() async {
    if (!formKey.currentState!.validate() ||
        selectedCategory == null ||
        selectedImage == null) {

      if (selectedCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Select Category',
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }

      if (selectedImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Please select an image',
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }

      return;
    }

    final product =
    await context.read<InsertProductCubit>().addProduct(
      title: nameController.text,
      price: double.parse(priceController.text),
      description: descController.text,
      category: selectedCategory!,
      image: selectedImage!.path, // مؤقتاً path
    );

    if (mounted) {
      context.read<ProductCubit>().addLocalProduct(product);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Product Added Successfully',
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Padding(
        padding:  EdgeInsets.all(16.r),
        child: BlocConsumer<InsertProductCubit, InsertProductState>(
          listener: (context, state) {
            if (state is InsertProductError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message,
                    style:
                     TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: ListView(
                children: [
                  _buildHeader(),

                  _buildLabel("IMAGE"),
                  _buildImagePicker(),

                  _buildLabel("PRODUCT NAME"),
                  _buildTextField(nameController, "Product name"),

                  _buildLabel("CATEGORY"),
                  _buildDropdown(),

                  _buildLabel("PRICE"),
                  _buildTextField(priceController, "0.00",
                      isNumber: true),

                  _buildLabel("DESCRIPTION"),
                  _buildTextField(descController, "Description",
                      maxLines: 5),

                   Gap(20.h),

                 CustomButton(
                   height: 53.h,
                   onTap: state is InsertProductLoading?null:_submitData,
                   title: state is InsertProductLoading
                     ? 'Loading...'
                     : 'Save Product',
                     ),
                  Gap(20.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ---------- UI ----------

  Widget _buildHeader() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:  [
      Text('New Product',
          style:
          TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold)),
      SizedBox(height: 10.h),
      Text('Add a new item to your collection.'),
      SizedBox(height: 10.h),
    ],
  );

  Widget _buildLabel(String text) => Padding(
    padding:  EdgeInsets.only(top: 16.r, bottom: 8.r),
    child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  Widget _buildTextField(TextEditingController controller, String hint,
      {int maxLines = 1, bool isNumber = false}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType:
      isNumber ? TextInputType.number : TextInputType.text,
      validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xffFFD2CF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  //select image
  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: pickImage,
      child: Container(
        height: 150.h,
        decoration: BoxDecoration(
          color: const Color(0xffFFD2CF),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: selectedImage == null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(Icons.image, size: 40.r, color: Colors.grey),
            SizedBox(height: 10.h),
            Text("Tap to select image"),
          ],
        )
            : ClipRRect(
          borderRadius: BorderRadius.circular(12.sp),
          child: Image.file(
            selectedImage!,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown() => Container(
    padding:  EdgeInsets.symmetric(horizontal: 12.w),
    decoration: BoxDecoration(
      color: const Color(0xffFFD2CF),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedCategory,
        hint: const Text("Select category"),
        isExpanded: true,
        items: [
          "men's clothing",
          "women's clothing",
          "jewelery",
          "electronics"
        ]
            .map((c) =>
            DropdownMenuItem(value: c, child: Text(c)))
            .toList(),
        onChanged: (v) => setState(() => selectedCategory = v),
      ),
    ),
  );
}