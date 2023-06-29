import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import 'details_order.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  var oData = Orders.list;
  bool isPick = false;
  int a = 5;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              MediaQuery.of(context).size.height * 0.05,
            ),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Container(),
              bottom: const TabBar(
                indicatorColor: Colors.redAccent,
                indicatorWeight: 5,
                tabs: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 5,
                    ),
                    child: Text(
                      "Pick ups",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 5,
                    ),
                    child: Text(
                      "Orders",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: oData.length,
                itemBuilder: (context, index) {
                  return _buildOrders(
                    context,
                    index,
                  );
                },
              ),
              ListView.builder(
                itemCount: oData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: _buildOrders(
                      context,
                      index,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => DetailedOrderScreen(
                            oData[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrders(BuildContext context, index) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: [
            _buildDetails('Name:', oData[index].name),
            _buildDetails('Type:', oData[index].type),
            _buildDetails('Location:', oData[index].location),
            _buildDetails('House no.:', oData[index].houseNumber),
            _buildDetails('Status:', oData[index].status),
          ],
        ),
      ),
    );
  }

  Row _buildDetails(String title, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 19,
          ),
        ),
      ],
    );
  }
}
