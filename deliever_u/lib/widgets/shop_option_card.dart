import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rappi_u/utils/colors.dart';

class StoreOptionCard extends StatelessWidget {
  final String shopName;
  final String description;
  final String image;

  const StoreOptionCard({
    super.key,
    required this.shopName,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push('/store');
      },
      child: Card(
          surfaceTintColor: AppColors.red,
          color: AppColors.tertiaryColor,
          elevation: 4,
          child: SizedBox(
            height: 120,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.network(
                    image,
                    width: 120,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(shopName),
                ),
              ],
            ),
          )),
    );
  }
}
