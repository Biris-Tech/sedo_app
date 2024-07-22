import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: viewModel.getViewFromIndex(viewModel.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10,
        unselectedItemColor: const Color(0xFF404040),
        selectedItemColor: linearcolor.colors.first,
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Map.svg', height: 24, width: 24),
            activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return linearcolor.createShader(bounds);
                },
                child: SvgPicture.asset(
                  'assets/MapColor.svg',
                  height: 24,
                  width: 24,
                )),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/PointOnMap.svg',
                height: 24, width: 24),
            activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return linearcolor.createShader(bounds);
                },
                child: SvgPicture.asset('assets/PointOnMap.svg',
                    height: 24, width: 24)),
            label: 'Lieux',
          ),
          BottomNavigationBarItem(
            icon:
                SvgPicture.asset('assets/Delivery.svg', height: 26, width: 24),
            activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return linearcolor.createShader(bounds);
                },
                child: SvgPicture.asset('assets/deliveryColor.svg',
                    height: 24, width: 24)),
            label: 'Coursiers',
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.bell,
            ),
            activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return linearcolor.createShader(bounds);
                },
                child: const FaIcon(FontAwesomeIcons.bell)),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.circleUser,
            ),
            activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return linearcolor.createShader(bounds);
                },
                child: const FaIcon(FontAwesomeIcons.circleUser)),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
