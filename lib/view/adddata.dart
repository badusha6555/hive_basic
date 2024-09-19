import 'package:flutter/material.dart';
import 'package:retest_app/functions/functions.dart';
import 'package:retest_app/model/model.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _rollNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    } else {
                      return null;
                    }
                  },
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: 'Name', border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your age';
                    } else {
                      return null;
                    }
                  },
                  controller: _ageController,
                  decoration: const InputDecoration(
                      labelText: 'Age', border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your class';
                    } else {
                      return null;
                    }
                  },
                  controller: _rollNoController,
                  decoration: const InputDecoration(
                      labelText: 'Class', border: OutlineInputBorder()),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      onAddStudentBtn();
                      Navigator.pop(context);
                    }
                  },
                  child: const Icon(
                    Icons.person_add_alt,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onAddStudentBtn() async {
    final name = _nameController.text;
    final age = _ageController.text;
    final rollNo = _rollNoController.text;

    if (name.isEmpty || age.isEmpty || rollNo.isEmpty) {
      return;
    }
    final student = Student(
      name: name,
      age: age,
      rollNo: rollNo,
    );
    addStudent(student);
  }
}
