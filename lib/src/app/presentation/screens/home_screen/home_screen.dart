import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/src/core/presentation/widget/cached_image_network.dart';
import 'package:grocery_app/src/core/presentation/widget/icon_button.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(end: 15.w, start: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: AlignmentDirectional.topEnd,
                child: CustomIconButton(
                  icon: Icons.search,
                ),
              ),
              10.verticalSpace,
              Text(
                'Hey Ahmed',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              10.verticalSpace,
              Text(
                AppStrings.bodyHome.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:  InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        hintText: AppStrings.searchForProduct.tr(),
                        suffixIcon: const Icon(Icons.cancel_outlined),
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  CustomIconButton(
                    icon: Icons.filter_list_outlined,
                    backgroundColor: AppColors.green.withOpacity(0.4),
                  ),
                ],
              ),
              30.verticalSpace,
              SizedBox(
                height: 110.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CachedImages(
                          height: 40.h,
                          width: 70.w,
                          imageUrl:
                              'https://cdn-icons-png.flaticon.com/512/590/590772.png',
                        ),
                        10.verticalSpace,
                        Text(
                          'Fruits',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w100),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return 10.horizontalSpace;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
