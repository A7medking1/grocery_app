import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';

class CustomListTile extends StatelessWidget {

  final String title ;
  final void Function() onTap;
  final IconData? icon;


  const CustomListTile({
    super.key,
    required this.title,
    required this.onTap,
    this.icon ,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 15.h),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: ListTile(
              leading:  Icon(
                icon,
                color: AppColors.green,
                size: 30,
              ),
              title: Text(
                title,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              trailing: const Icon(Icons.arrow_forward_ios,size: 28,),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
