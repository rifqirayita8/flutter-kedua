// ignore_for_file: unused_local_variable, unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:vi_whatsapp/theme.dart';
import 'package:vi_whatsapp/widgets/calls_view.dart';
import 'package:vi_whatsapp/widgets/camera_view.dart';
import 'package:vi_whatsapp/widgets/chat_view.dart';
import 'package:vi_whatsapp/widgets/status_view.dart';

class WhatsAppPage extends StatefulWidget {
  const WhatsAppPage({super.key});

  @override
  State<WhatsAppPage> createState() => _WhatsAppPageState();
}

class _WhatsAppPageState extends State<WhatsAppPage> 
  with SingleTickerProviderStateMixin{
  final tabs= const [
Tab(
        icon: Icon(Icons.camera_alt_rounded, size: 24),
      ),
  Tab(
        text: "Chats"),
   
  Tab(
      text: "Updates"),
Tab(
      text: "Calls")
    
    
  ];
  
  TabController? tabController;
  var fabIcon= Icons.message_sharp;

  @override
  void initState() {
    super.initState();
    tabController= TabController(length: tabs.length, vsync: this);
    tabController?.index= 1;
    tabController?.addListener(() { 
      setState(() {
        switch(tabController?.index){
          case 0:
            fabIcon= Icons.camera;
            break;
          case 1:
            fabIcon= Icons.message;
            break;
          case 2:
            fabIcon= Icons.camera_alt;
            break;
          case 3:
            fabIcon= Icons.add_ic_call;
            break;
            default:
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Icon(Icons.camera_alt_outlined),
            SizedBox(width: 20), Icon(Icons.search),
            SizedBox(width: 15), Icon(Icons.more_vert),
          ],
        ),
      ),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: tabs,
          indicatorColor: Colors.white,
        ),
        backgroundColor: Color(0xFF08846C),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          
          CameraView(),
          ChatView(),
          // Center(child: Icon(Icons.message)),
          StatusView(),
          CallsView()
        ],      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(fabIcon),
        backgroundColor: Color(0xFF008069),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18)
          ),
        ),
    );

    Text("MOMMMYY");
  }
}