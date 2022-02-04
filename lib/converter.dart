import 'package:etherwallet/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConverterPage extends StatelessWidget {
  Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1a0441),
        title: const Text('Converter'),
      ),
      body: GetBuilder<Controller>(
          init: Controller.to,
          builder: (_) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("Trocar WBNB por ECOIN a valor de mercado"),
                      TextField(
                        obscureText: false,
                        controller: _.WBNBinput,
                        // onChanged: onChanged,
                        maxLines: 1,
                        cursorColor: const Color(0xff1a0441),
                        keyboardType: TextInputType.number,

                        decoration: const InputDecoration(
                            focusColor: Color(0xff1a0441),
                            fillColor: Color(0xff1a0441),
                            hoverColor: Color(0xff1a0441),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff1a0441)))),
                      ),
                      ElevatedButton(
                        child: Text('Trocar'),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff1a0441))),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("Trocar ECOIN por WBNB a valor de mercado"),
                      TextField(
                        obscureText: false,
                        controller: _.WBNBinput,
                        // onChanged: onChanged,
                        maxLines: 1,
                        cursorColor: const Color(0xff1a0441),
                        keyboardType: TextInputType.number,

                        decoration: const InputDecoration(
                            focusColor: Color(0xff1a0441),
                            fillColor: Color(0xff1a0441),
                            hoverColor: Color(0xff1a0441),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff1a0441)))),
                      ),
                      ElevatedButton(
                        child: Text('Trocar'),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Color(0xff1a0441))),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
