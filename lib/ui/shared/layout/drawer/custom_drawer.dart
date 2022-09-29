import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/shared/layout/drawer/custom_drawer_viewmodel.dart';
import 'package:stacked_architecture/ui/styles/ui_helpers.dart';

class CustomDrawerView extends StatelessWidget {
  const CustomDrawerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomDrawerViewModel>.reactive(
      viewModelBuilder: () => CustomDrawerViewModel(),
      builder: (context, model, chilld) => Drawer(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(color: Colors.black),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(80.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://cdn.dribbble.com/users/1338391/screenshots/15264109/media/1febee74f57d7d08520ddf66c1ff4c18.jpg",
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                      ),
                      verticalSpaceRegular,
                      const Text(
                        'John Doe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        'john@example.com',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Your Profile'),
              onTap: model.navigateToProfileView,
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Purchase History'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border_rounded),
              title: const Text('Favorites'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
