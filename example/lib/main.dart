import 'package:example/predefine_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutrace_package/flutrace_package.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:math';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Flutrace.init(
    FlutraceConfig(
      // projectToken: '15a5af3d4f274a65ba3475a518adbb76',
      projectToken: '9a1692bb07d14f75a411898e969442fe',
      environment: 'production',
      isProduction: true,
      defaultMetadata: {'appVersion': '1.0.0'},
    ),
  );

  runApp(const FlutraceTestApp());
}

class FlutraceTestApp extends StatelessWidget {
  const FlutraceTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SwipeTestScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SwipeTestScreen extends StatefulWidget {
  const SwipeTestScreen({super.key});

  @override
  State<SwipeTestScreen> createState() => _SwipeTestScreenState();
}

class _SwipeTestScreenState extends State<SwipeTestScreen> {
  final List<Map<String, dynamic>> logs = [];
  final List<Widget> cards = [];

  @override
  void initState() {
    super.initState();
    generateFakeLogs();
  }

  void generateFakeLogs() {
    // final random = Random();
    // final levels = ['info', 'warning', 'error', 'debug'];
    // final messages = [
    //   'Null pointer exception',
    //   'Missing auth token',
    //   'Network timeout',
    //   'Invalid response format',
    //   'Permission denied',
    //   'Device storage full',
    // ];
    // final devices = [
    //   {'model': 'Pixel 6', 'os': 'Android', 'version': '13'},
    //   {'model': 'iPhone 13', 'os': 'iOS', 'version': '16.4'},
    //   {'model': 'Samsung S22', 'os': 'Android', 'version': '12'},
    // ];
    //
    // for (int i = 0; i < 10; i++) {
    //   final level = levels[random.nextInt(levels.length)];
    //   final device = devices[random.nextInt(devices.length)];
    //   final log = {
    //     'message': messages[random.nextInt(messages.length)],
    //     'level': level,
    //     'device': device,
    //     'errorName': 'SimulatedError',
    //     'errorCode': 'E${random.nextInt(900) + 100}',
    //     'customMetadata': {'testerNote': 'swipe test'},
    //   };
    // }

    for (final log in predefinedLogs) {
      logs.add(log);
      cards.add(LogCard(log: log, device: log['device']));
    }
  }

  void sendLog(int index) {
    final log = logs[index];

    Flutrace.log(
      log['message'],
      level: log['level'],
      errorName: log['errorName'],
      errorCode: log['errorCode'],
      customMetadata: {
        ...log['customMetadata'],
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        centerTitle: true,
        title: const Text(
          'Swipe to Send Logs',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
      ),
      body: SafeArea(
        child: CardSwiper(
          cardsCount: cards.length,
          cardBuilder: (context, index, _, __) => cards[index],
          onSwipe: (int index, int? previousIndex,
              CardSwiperDirection direction) async {
            if (direction == CardSwiperDirection.right) {
              sendLog(index);
              debugPrint('Log sent: ${logs[index]['message']}');
              return true;
            } else {
              debugPrint('Log skipped: ${logs[index]['message']}');
              return true;
            }
          },
          onEnd: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('All logs swiped!')),
            );
          },
        ),
      ),
    );
  }
}

class LogCard extends StatelessWidget {
  final Map<String, dynamic> log;
  final Map<String, dynamic> device;

  const LogCard({
    required this.log,
    required this.device,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 82),
      child: Card(
        color: const Color(0xFF3772FF),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${log['message']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              Text(
                'Code: ${log['errorCode']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              ),
              // Text(
              //   'Device: ${device['model']} (${device['version']})',
              //   style: const TextStyle(
              //     color: Colors.white,
              //     fontSize: 18,
              //     fontWeight: FontWeight.w400,
              //     fontFamily: 'Inter',
              //   ),
              // ),
              Text(
                'Level: ${log['level']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
