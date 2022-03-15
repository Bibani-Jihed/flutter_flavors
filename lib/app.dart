import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MyApp extends StatelessWidget {
  final String env;
  const MyApp({Key? key, required this.env}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: !env.toLowerCase().contains("prod"),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(env)),
        ),
        body: FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              PackageInfo? packageInfo = snapshot.data as PackageInfo?;
              return snapshot.connectionState == ConnectionState.done
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Environement: env"),
                        Text("AppName : ${packageInfo?.appName}"),
                        Text("PackageName  : ${packageInfo?.packageName}"),
                        Text("Version  : ${packageInfo?.version}"),
                      ],
                    ))
                  : Container();
            }),
      ),
    );
  }
}
