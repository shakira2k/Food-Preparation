import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatefulWidget {
  Description({super.key, required this.datas, required this.imageUrls});

  var datas;
  var imageUrls;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Description',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: false,
        // backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 350,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    //border: Border.all(color: Colors.black, width: 2),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.imageUrls) //image of the item
                        )),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    widget.datas[0].toString(),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              const Divider(
                color: Colors.deepOrange,
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Wrap(
                spacing: 5,
                children: [
                  Chip(label: Text(widget.datas[7])),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  Chip(label: Text(widget.datas[8])),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  Chip(label: Text(widget.datas[9])),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  Chip(label: Text(widget.datas[10])),
                  SizedBox(
                    width: width * 0.015,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Preparation',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.datas[1],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                runSpacing: 5,
                children: [
                  Text(
                    "Step 1 : ${widget.datas[3]}",
                    style: GoogleFonts.abyssinicaSil(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Step 2 : ${widget.datas[4]}",
                    style: GoogleFonts.abyssinicaSil(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Step 3 : ${widget.datas[5]}",
                    style: GoogleFonts.abyssinicaSil(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Step 4 : ${widget.datas[6]}",
                    style: GoogleFonts.abyssinicaSil(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const Row(
                children: [
                  Text(
                    'Nutritions',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                runSpacing: 5,
                spacing: 10,
                children: [
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 5,
                    color: Colors.deepOrange.shade400,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget.datas[11],
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 5,
                    color: Colors.deepOrange.shade400,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget.datas[12],
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ),
                    ),
                  ),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 5,
                    color: Colors.deepOrange.shade400,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget.datas[13],
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 5,
                    color: Colors.deepOrange.shade400,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget.datas[14],
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
