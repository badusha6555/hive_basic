import 'package:flutter/material.dart';
import 'package:retest_app/functions/functions.dart';
import 'package:retest_app/model/model.dart';
import 'package:retest_app/view/adddata.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddData()),
        );
      }),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: studentListNotifier,
              builder:
                  (BuildContext, List<Student> studentList, Widget? child) {
                return _buildStudentList(studentList);
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                studentListNotifier.value = [];
                getAllStudents();
              },
              child: Text('Store'))
        ],
      ),
    );
  }
}

Widget _buildStudentList(List<Student> students) {
  return students.isEmpty
      ? const Center(
          child: Text(
            'No students available.',
            style: TextStyle(color: Colors.white),
          ),
        )
      : ListView.separated(
          itemCount: students.length,
          itemBuilder: (context, index) {
            final data = students[index];
            return ListTile(
              title: Text(data.name!),
              subtitle: Text(data.rollNo.toString()),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(thickness: 1, color: Colors.white);
          });
}
