import 'package:artifitia/core/utils/app_colors%20.dart';
import 'package:artifitia/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

import '../provider/app_root_provider.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key, this.currentIndex = 0});
  final int currentIndex;

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  List<Widget> get _pages => <Widget>[
    // HomeScreen(),
    // FavoriteScreen(),
    // MyCousersScreen(),
    // NewsScreen(),
    // AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // return Consumer<AppRootProvider>(
    //   builder: (context, appRootState, child) {
    final selectedIndex = 1;
    // appRootState.selectedBarItemIndex;
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Center(child: _pages.elementAt(selectedIndex)),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(113),
          child: SizedBox(
            height: 64,
            child: BottomNavigationBar(
              // landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
              selectedLabelStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: TextStyle(
                color: AppColors.black.withOpacity(0.5),
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
              backgroundColor: AppColors.greyShade,
              elevation: 25,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset(
                    selectedIndex == 0
                        ? AppIcons.bottomBarAtiveHome
                        : AppIcons.bottomBarInativeHome,
                    height: 22,
                    width: 22,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    selectedIndex == 1
                        ? AppIcons.bottomBarAtiveFavorate
                        : AppIcons.bottomBarInativeFavorate,
                    height: 22,
                    width: 22,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    selectedIndex == 2
                        ? AppIcons.bottomBarAtiveCourses
                        : AppIcons.bottomBarAtiveFavorate,
                    height: 22,
                    width: 22,
                  ),
                  label: 'My Courses',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    selectedIndex == 3
                        ? AppIcons.bottomBarAtiveNews
                        : AppIcons.bottomBarInativeNews,
                    height: 22,
                    width: 22,
                  ),
                  label: 'News',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    selectedIndex == 4
                        ? AppIcons.bottomBarAtiveAccount
                        : AppIcons.bottomBarInativeAccount,
                    height: 22,
                    width: 22,
                  ),
                  label: 'Account',
                ),
              ],
              currentIndex: selectedIndex,
              // onTap: appRootState.onItemTapped,
            ),
          ),
        ),
      ),
    );
    //     },
    //   );
  }
}
