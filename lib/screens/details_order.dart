import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../models/order_model.dart';

class DetailedOrderScreen extends StatefulWidget {
  final Orders data;
  const DetailedOrderScreen(this.data, {super.key});

  @override
  State<DetailedOrderScreen> createState() => _DetailedOrderScreenState();
}

class _DetailedOrderScreenState extends State<DetailedOrderScreen> {
  bool isChecked = false;
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        navigationBar: const CupertinoNavigationBar(),
        body: Card(
          margin: const EdgeInsets.all(0),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Details of your order',
                    style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.58,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildOrderDetails(
                            'Type of order: ',
                            widget.data.name,
                          ),
                          //! product name
                          _buildOrderDetails(
                            'Name of order: ',
                            widget.data.location,
                          ),
                          //! number of items
                          //? there will also be number of order witht he itemname
                          _buildOrderDetails(
                            'Number of days:',
                            widget.data.houseDescription,
                          ),
                          //! amount of order
                          _buildOrderDetails(
                            'Price: ',
                            widget.data.houseNumber,
                          ),
                          //! status of order
                          _buildOrderDetails(
                            'Status: ',
                            '${widget.data.cost}',
                          ),
                          //! date of order
                          _buildOrderDetails(
                            'Date of order: ',
                            widget.data.paymentMethod,
                          ),
                          //! number of days remaining
                          _buildOrderDetails(
                            'Number of days remaining:',
                            widget.data.status,
                          ),
                          _buildOrderDetails(
                            'Number of days remaining:',
                            widget.data.type,
                          ),
                          _buildOrderDetails(
                            'Number of days remaining:',
                            widget.data.type,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.015,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  'Return',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.015,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  'Cancel Order',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> confirmCancel(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return CupertinoAlertDialog(
            title: const Text(
              "Order confirmation",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            content: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  // color: Colors.amber,
                  child: const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero, molestiae quo illum sapiente saepe cupiditate id velit mollitia, numquam architecto eligendi odio. Nihil asperiores perspiciatis nostrum assumenda ratione iste architecto.,",
                    textAlign: TextAlign.left,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
                Card(
                  shadowColor: Colors.transparent,
                  color: Colors.white70,
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const SizedBox(
                      height: 40,
                      width: 50,
                      child: Text(
                        "Accept our terms and conditions",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    value: isChecked,
                    onChanged: (checked) {
                      // print(isAccept.toString());
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                  ),
                ),
                showError == true
                    ? const Text(
                        'You must accept our terms and conditions to proceed',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                        ),
                      )
                    : Container(),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("close"),
              ),
              CupertinoDialogAction(
                isDestructiveAction: false,
                onPressed: () {
                  if (isChecked == false) {
                    setState(() {
                      showError = true;
                    });
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Confirm"),
              ),
            ],
          );
        });
      },
    );
  }

  Widget _buildOrderDetails(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
