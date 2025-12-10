import 'package:flutter/material.dart';
import 'app_list.dart';
import 'app_shell.dart';

class MySimpleDrawer extends StatelessWidget {
  const MySimpleDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text(
                "Danh sách ứng dụng",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),

          ...allApps.map((app) {
            return ListTile(
              title: Text(app.name),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        AppShell(title: app.name, child: app.screen),
                  ),
                );
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
