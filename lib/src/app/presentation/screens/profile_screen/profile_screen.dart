import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/src/app/presentation/screens/profile_screen/widget/list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 170.h,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    width: double.infinity,
                    height: 140.h,
                    decoration: const BoxDecoration(
                      //color: AppColors.green,
                      borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //  topRight: Radius.circular(10),
                          ),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://as2.ftcdn.net/v2/jpg/00/69/42/49/1000_F_69424905_vxTpRGAcVKni9157VpKAOG6MpTX30etl.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: const CircleAvatar(
                    radius: 55.0,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/indoor-shot-positive-bearded-male-casual-red-t-shirt-points-with-index-finger-aside_273609-16274.jpg?w=826&t=st=1680988578~exp=1680989178~hmac=f17897f94c5d68ec94ec3e6955fec5a4d6ae371b382a740d54a2c9fc3213f804'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          SizedBox(height: 20.h,),
            const BuildListTile(),
        ],
      ),
    );
  }
}


