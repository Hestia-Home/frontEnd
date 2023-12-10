// ignore_for_file: depend_on_referenced_packages
import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hestia/core/common/domain/entity/substates/user_state.dart';
import 'package:hestia/feature/main/presentation/screens/main_wm.dart';
import 'package:hestia/feature/main/presentation/widgets/room_view.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

@RoutePage(name: 'MainRoute')
class MainWidget extends ElementaryWidget<IMainWidgetModel> {
  MainWidget({
    Key? key,
    WidgetModelFactory wmFactory = createMainWM,
  }) : super(wmFactory, key: key);

  final PageController _controller = PageController();

  @override
  Widget build(IMainWidgetModel wm) {
    initializeDateFormatting();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          leadingWidth: double.maxFinite,
          leading: EntityStateNotifierBuilder<UserState>(
            listenableEntityState: wm.userState,
            builder: (context, userState) {
              if (userState == null) {
                return Shimmer(
                  child: Container(
                    color: Colors.blueGrey.shade200,
                    height: 65,
                    width: wm.size.width - 32,
                  ),
                );
              }
              return EntityStateNotifierBuilder<DateTime>(
                listenableEntityState: wm.dateTimeState,
                builder: (_, dateTime) => _userComponent(
                  dateTime: dateTime!,
                  userAvatar: wm.getUserAvatar(),
                  userState: userState,
                ),
              );
            },
          ),
        ),
        body: SafeArea(
          child: EntityStateNotifierBuilder(
              listenableEntityState: wm.roomsState,
              builder: (context, rooms) {
                if (rooms == null) {
                  return Shimmer(
                    child: Container(
                      color: Colors.blueGrey.shade200,
                      height: 65,
                      width: wm.size.width - 32,
                    ),
                  );
                }
                return Center(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: rooms.length,
                    itemBuilder: ((context, index) =>
                        RoomView(devicesState: wm.devicesState)),
                  ),
                );
              }),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                label: 'Главная'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.black,
                  size: 40,
                ),
                label: 'Добавить'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.insert_chart_outlined_rounded,
                  size: 30,
                ),
                label: 'Статистика'),
          ],
        ));
  }

  Widget _userComponent(
      {required DateTime dateTime,
      required UserState userState,
      required ImageProvider userAvatar}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: userAvatar,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userState.name,
                style: const TextStyle(
                    color: Colors.black,
                    letterSpacing: 0.8,
                    fontFamily: "Lexend",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat('EEEE, d MMMM', 'ru').format(dateTime).toTitleCase(),
                style: const TextStyle(
                    letterSpacing: 0.8,
                    fontFamily: "Lexend",
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: Color.fromARGB(255, 104, 104, 104)),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    size: 25,
                    color: Colors.black,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
