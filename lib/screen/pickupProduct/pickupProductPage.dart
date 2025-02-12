import 'package:flutter/material.dart';
import 'package:poswarehouse/constants/constants.dart';
import 'package:poswarehouse/screen/login/widgets/appTextForm.dart';
import 'package:poswarehouse/screen/pickupProduct/createPickupOrderPage.dart';

class PickupProductPage extends StatefulWidget {
  PickupProductPage({Key? key}) : super(key: key);

  @override
  State<PickupProductPage> createState() => _PickupProductPageState();
}

class _PickupProductPageState extends State<PickupProductPage> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('เบิกสินค้า'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: size.width * 0.64,
                      height: size.height * 0.08,
                      child: appTextFormField(
                        sufPress: () {},
                        preIcon: Icons.search,
                        vertical: 25.0,
                        horizontal: 10.0,
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CeatePickupOrderPage()));
                      },
                      child: Container(
                        width: size.width * 0.1,
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kPrimaryColor),
                        child: Center(
                          child: Text(
                            'เบิกสินค้า',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                width: double.infinity,
                child: DataTable(
                    columns: <DataColumn>[
                      DataColumn(
                        label: Text('รหัส'),
                      ),
                      DataColumn(
                        label: Text('วันที่'),
                      ),
                      DataColumn(
                        label: Text('จาก'),
                      ),
                      DataColumn(
                        label: Text('ไปยัง'),
                      ),
                      DataColumn(
                        label: Text('สถานะ'),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        pickupproduct.length,
                        (index) => DataRow(
                              color: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                // All rows will have the same selected color.
                                if (states.contains(MaterialState.selected)) {
                                  return Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.08);
                                }
                                // Even rows will have a grey color.
                                if (index.isEven) {
                                  return Colors.grey.withOpacity(0.3);
                                }
                                return null; // Use default value for other states and odd rows.
                              }),
                              cells: <DataCell>[
                                DataCell(Text('${pickupproduct[index]['id']}')),
                                DataCell(
                                    Text('${pickupproduct[index]['date']}')),
                                DataCell(
                                    Text('${pickupproduct[index]['form']}')),
                                DataCell(
                                    Text('${pickupproduct[index]['to']}')),
                                DataCell(Chip(
                                    labelPadding: EdgeInsets.all(2.0),
                                    elevation: 6.0,
                                    shadowColor: Colors.grey[60],
                                    backgroundColor: pickupproduct[index]
                                                ['status'] =='สำเร็จ'
                                        ? Colors.green
                                        : Colors.red,
                                    label: Text(
                                        '${pickupproduct[index]['status']}'))),
                                DataCell(Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.remove_red_eye_outlined)),
                                    IconButton(
                                        onPressed: () {},
                                        icon:
                                            Icon(Icons.edit_calendar_outlined)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.delete)),
                                  ],
                                ))
                              ],
                              selected: selected[index],
                              onSelectChanged: (bool? value) {
                                setState(() {
                                  selected[index] = value!;
                                });
                              },
                            ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
