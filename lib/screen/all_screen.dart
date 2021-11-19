import 'package:dukk/bloc/bloc.dart';
import 'package:dukk/const.dart';
import 'package:dukk/data/data.dart';
import 'package:dukk/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllEmployee extends StatefulWidget {
  const AllEmployee({Key? key}) : super(key: key);
  static String routeName = '/all';

  @override
  State<AllEmployee> createState() => _AllEmployeeState();
}

bool showButtons = false;

class _AllEmployeeState extends State<AllEmployee> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        height: deviceHeight,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            title: Container(
              decoration: const BoxDecoration(
                  border: Border(
                left: BorderSide(color: Colors.black, width: 3),
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    'SAMASYS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25,
                      letterSpacing: 20,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 14),
                    child: Text(
                      "combat salary fraud",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            ),
          ),
          drawer: const Drawer(
            child: SafeArea(child: Text("Demo Drawer")),
          ),
          body: SizedBox(
            height: deviceHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "EMPLOYEES",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  child: BlocBuilder<DataCubit, List<Employee>>(
                    buildWhen: (previousState, state) {
                      return previousState != state;
                    },
                    builder: (context, data) => ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              showButtons = true;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            child: Card(
                              child: SizedBox(
                                height: 160,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Image.asset(
                                        data[index].image,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topLeft,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              data[index].name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25),
                                            ),
                                            Text(data[index].title,
                                                style: detailTitle),
                                            Text(
                                                '(+234)(0)${data[index].phoneNumber.toString()}',
                                                style: detailTitle),
                                            Text(data[index].email,
                                                style: detailTitle),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: showButtons
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        GestureDetector(
                                                            onTap: () {
                                                              DataCubit()
                                                                  .delete(data[
                                                                          index]
                                                                      .id);
                                                              setState(() {});
                                                            },
                                                            child: const Icon(
                                                              Icons.delete,
                                                            )),
                                                        GestureDetector(
                                                            onTap: () {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                const SnackBar(
                                                                  content: Text(
                                                                      "This feature in not available yet"),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                ),
                                                              );
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .hideCurrentSnackBar();
                                                              });
                                                            },
                                                            child: const Icon(
                                                                Icons.edit))
                                                      ],
                                                    )
                                                  : const Text(""),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
