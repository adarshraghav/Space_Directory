import 'package:employee_record/home.dart';
import 'package:employee_record/roscos/connector.dart';
import 'package:employee_record/roscos/db2.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    ));

class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen2> {
  final DBHelper2 dbHelper = new DBHelper2();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _datumController = TextEditingController();
  TextEditingController _detailController = TextEditingController();
  TextEditingController _rockstatController = TextEditingController();
  TextEditingController _costController = TextEditingController();
  TextEditingController _missionController = TextEditingController();
  Connector employee;

  List<Connector> empList;
  int updateIndex;

  void initState() {
    super.initState();
    refreshList();
  }

  refreshList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Roscosmos Records'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                openDialogueBox(context);
              },
              child: Icon(
                Icons.add,
                size: 27.0,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: dbHelper.getEmployeeList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            empList = snapshot.data;
            return ListView.builder(
                shrinkWrap: true,
                itemCount: empList == null ? 0 : empList.length,
                itemBuilder: (BuildContext context, int index) {
                  Connector emp = empList[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Name : ${emp.name}',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Location : ${emp.location}',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Datum : ${emp.datum}',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Detail : ${emp.detail}',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Rock Status : ${emp.rockstat}',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Cost : ${emp.cost}',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Mission Status : ${emp.missionstat}',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              openDialogueBox(context);
                              employee = emp;
                              updateIndex = index;
                            },
                            icon: Icon(Icons.edit, color: Colors.blueAccent),
                          ),
                          IconButton(
                            onPressed: () {
                              dbHelper.deleteEmployee(emp.id);
                              setState(() {
                                empList.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete_sweep,
                                color: Colors.redAccent),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
          return new CircularProgressIndicator();
        },
      ),
    );
  }

  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add A New Entry'),
            content: Container(
              height: 350,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(hintText: 'Mission Name'),
                  ),
                  TextField(
                    controller: _locationController,
                    decoration: InputDecoration(hintText: 'Location'),
                  ),
                  TextField(
                    controller: _datumController,
                    decoration: InputDecoration(hintText: 'Datum'),
                  ),
                  TextField(
                    controller: _detailController,
                    decoration: InputDecoration(hintText: 'Detail'),
                  ),
                  TextField(
                    controller: _rockstatController,
                    decoration: InputDecoration(hintText: 'Status Of Rocket'),
                  ),
                  TextField(
                    controller: _costController,
                    decoration: InputDecoration(hintText: 'Cost in Million'),
                  ),
                  TextField(
                    controller: _missionController,
                    decoration: InputDecoration(hintText: 'Mission Status'),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  submitAction(context);
                  refreshList();
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }

  submitAction(BuildContext context) {
    if (employee == null) {
      Connector st = new Connector(
          name: _nameController.text,
          location: _locationController.text,
          datum: _datumController.text,
          detail: _detailController.text,
          rockstat: _rockstatController.text,
          cost: _costController.text,
          missionstat: _missionController.text);
      dbHelper.insertEmployee(st).then((value) => {
            _nameController.clear(),
            _locationController.clear(),
            _datumController.clear(),
            _detailController.clear(),
            _rockstatController.clear(),
            _costController.clear(),
            _missionController.clear(),
            print("Employee record added to db $value")
          });
    } else {
      employee.name = _nameController.text;
      employee.location = _locationController.text;
      employee.datum = _datumController.text;
      employee.detail = _detailController.text;
      employee.rockstat = _rockstatController.text;
      employee.cost = _costController.text;
      employee.missionstat = _missionController.text;
      dbHelper.updateEmployee(employee).then((value) => {
            _nameController.clear(),
            _locationController.clear(),
            _datumController.clear(),
            _detailController.clear(),
            _rockstatController.clear(),
            _costController.clear(),
            _missionController.clear(),
            setState(() {
              empList[updateIndex].name = _nameController.text;
              empList[updateIndex].location = _locationController.text;
              empList[updateIndex].datum = _datumController.text;
              empList[updateIndex].detail = _detailController.text;
              empList[updateIndex].rockstat = _rockstatController.text;
              empList[updateIndex].cost = _costController.text;
              empList[updateIndex].missionstat = _missionController.text;
            }),
            employee = null
          });
    }
  }
}
