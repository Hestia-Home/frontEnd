import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({super.key});

  @override
  State<AddDeviceScreen> createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Выберите тип устройства',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                // TODO: Добавить комнату
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(15),
                      ),
                      child: SizedBox(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Введите название новой комнаты',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  autocorrect: false,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          const BorderSide(color: Colors.black),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                ),
                                onPressed: () {},
                                child: const Text('Добавить'),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.add),
              color: Colors.black,
              splashRadius: 25,
              iconSize: 30,
            ),
          ],
        ),
      ),
      body: const Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DeviceTypeWidget(
                deviceIcon: Icon(Icons.thermostat),
                deviceName: 'Добавить датчик темпетатуры',
              ),
              DeviceTypeWidget(
                deviceIcon: Icon(Icons.lightbulb),
                deviceName: 'Добавить лампочку',
              ),
              DeviceTypeWidget(
                deviceIcon: Icon(Icons.co2),
                deviceName: 'Добавить датчик CO2',
              ),
              DeviceTypeWidget(
                deviceIcon: Icon(Icons.report_rounded),
                deviceName: 'Добавить датчик движения',
              ),
              DeviceTypeWidget(
                deviceIcon: Icon(Icons.cloud_sync_rounded),
                deviceName: 'Добавить климатическое устройство',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeviceTypeWidget extends StatelessWidget {
  const DeviceTypeWidget({
    super.key,
    required this.deviceName,
    required this.deviceIcon,
  });

  final String deviceName;
  final Icon deviceIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: MaterialButton(
          splashColor: Colors.transparent,
          onPressed: () {
            // TODO: нужно добавить "поиск"
            // неопределённых устройств заданного типа
            // и их добавление
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const SizedBox(
                    height: 200,
                    width: 200,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Неподключенные устройства',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Row(
            children: [
              deviceIcon,
              const SizedBox(width: 5),
              Text(
                deviceName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// showModalBottomSheet(
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(25.0),
//                     ),
//                   ),
//                   backgroundColor: Colors.white,
//                   context: context,
//                   isScrollControlled: true,
//                   builder: (context) => Padding(
//                     padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).viewInsets.bottom,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         const Padding(
//                           padding: EdgeInsets.only(top: 20),
//                           child: Text(
//                             'Название новой комнаты',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 8.0,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: TextField(
//                             onEditingComplete: () {
//                               // к существующим комнатам будет добавлена новая
//                             },
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );