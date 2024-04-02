import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:vi_whatsapp/models/camera.dart';
import 'package:vi_whatsapp/whatsapp_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras= await availableCameras();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      title: "wazzapp",
      home: const WhatsAppPage(
        
      )
    );
  }
}
