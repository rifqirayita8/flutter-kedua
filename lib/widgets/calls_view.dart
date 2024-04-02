import 'package:flutter/material.dart';
import 'package:vi_whatsapp/models/calls.dart';
import 'package:vi_whatsapp/theme.dart';

class CallsView extends StatelessWidget {
  const CallsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callList.length,
      itemBuilder: (context, index){
        final call= callList[index];
          return ListTile(
            leading: Image.network(call.image),
            title: Text(call.name,
            style: customTextStyle,
            ),
            subtitle: Text(
              call.callsDate,
              style: const TextStyle(
                color: Colors.black, 
                fontSize: 16
              ),
            ),
            trailing: 
            Icon(Icons.call),
            iconColor: Color(0xFF08846C)
          );
      }
    );
  }
}