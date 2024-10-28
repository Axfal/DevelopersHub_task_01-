import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zini_pay_app/services/notification_services.dart';
import '../components/colors.dart';
import '../provider/get_api_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String buttonText = "Start"; // Initial text of the button
  Timer? _timer; // Timer instance
  bool _isTimerRunning = false; // Flag to track if the timer is running

  @override
  void initState() {
    super.initState();
    // Fetch the API data when the screen initializes
    final getApiModel = Provider.of<GetApiModel>(context, listen: false);
    getApiModel.getApi();
  }

  // Function to start the timer and show notifications
  void startTimer() {
    // Check if timer is already running
    if (!_isTimerRunning) {
      _timer = Timer.periodic(Duration(seconds: 3), (timer) async {
        await showNotification();
      });
      setState(() {
        _isTimerRunning = true;
      });
    }
  }

  // Function to stop the timer and notifications
  void stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        _isTimerRunning = false;
      });
    }
  }

  // Function to show notification
  Future<void> showNotification() async {
    final getApiModel = Provider.of<GetApiModel>(context, listen: false);

    if (getApiModel.authModel != null && getApiModel.authModel!.data != null && getApiModel.authModel!.data!.isNotEmpty) {
      final data = getApiModel.authModel!.data;
      await NotificationService.showNotification(
        title: data![0].from ?? "+1234567890", // Default value if null
        body: data[0].message ?? "INCOMMING_SMS", // Default value if null
        summary: data[0].time ?? "2024-10-13 18:36:32", // Default value if null
        notificationLayout: NotificationLayout.Messaging,
      );
    } else {
      await NotificationService.showNotification(
        title: "860370751",
        body: "Please check back later.",
        summary: "2024-10-13 18:36:32",
        notificationLayout: NotificationLayout.Messaging,
      );
    }
  }

  // Function to toggle button text and start/stop timer
  void toggleText() {
    setState(() {
      if (_isTimerRunning) {
        stopTimer();
        buttonText = "Start";
      } else {
        startTimer();
        buttonText = "Stop";
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the screen is disposed
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'ZINI PAY',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Press the button',
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: toggleText, // Toggle between Start and Stop
              child: Text(buttonText),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                stopTimer();
              },
              child: Text('Stop'),
            )
          ],
        ),
      ),
    );
  }
}
