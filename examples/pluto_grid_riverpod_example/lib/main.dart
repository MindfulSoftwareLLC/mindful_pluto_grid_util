// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid_riverpod_example/add_job_button.dart';
import 'package:pluto_grid_riverpod_example/firebase_options.dart';
import 'package:pluto_grid_riverpod_example/jobs_grid.dart';

/// This was the basis for the pluto_grid "bug"
/// https://github.com/bosskmk/pluto_grid/issues/828
/// It's a simplified version of Andrea Bizzotto's
/// Flutter-Firebase Starter Architecture
/// https://github.com/bizz84/starter_architecture_flutter_firebase
///
/// It's adjusted to remove the listview and then to use the
/// mindful_pluto_util's PlutoGridBuilder and showing how pluto select
/// columns can be have dynamic values.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

int lastRate = 100;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const gridKey = GlobalObjectKey('JobsGrid');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
            title: 'Pluto Grid does not update with Riverpod stream Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Scaffold(
                body: SingleChildScrollView(
                    child: Column(children: const [
              AddJobButton(),
              SelectableText('Click to add a job.'),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 600,
                  child: JobsGrid(),
                ),
              ),
            ])))));
  }
}
