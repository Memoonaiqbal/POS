import 'package:flutter/material.dart';

class DishPage extends StatefulWidget {
  const DishPage({super.key});

  @override
  State<DishPage> createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  List<Map<String, dynamic>> dishes = [
{"sno": 1, "name": "Chicken Biryani", "price": "RS 1400", "category": "Biryani"},
{"sno": 2, "name": "Chicken Biryani Single", "price": "RS 1400", "category": "Biryani"},
{"sno": 3, "name": "Chicken Biryani 500gm Single Boti", "price": "RS 1750", "category": "Biryani"},
{"sno": 4, "name": "Chicken Biryani 500gm Double Boti", "price": "RS 2100", "category": "Biryani"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Biryani"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Biryani"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Biryani"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Biryani"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Biryani"},
{"sno": 5, "name": "Chicken Biryani 1KG", "price": "RS 2500", "category": "Biryani"},
{"sno": 6, "name": "Sada Biryani Single", "price": "RS 800", "category": "Biryani"},
{"sno": 7, "name": "Sada Biryani 500gm", "price": "RS 1000", "category": "Biryani"},
{"sno": 8, "name": "Sada Biryani 1KG", "price": "RS 1800", "category": "Biryani"},
{"sno": 9, "name": "Biryani Box", "price": "RS 2000", "category": "Biryani"},
{"sno": 10, "name": "Pao Chicken Pulao", "price": "RS 1000", "category": "Pulao"},
{"sno": 11, "name": "Chicken Pulao Single", "price": "RS 1200", "category": "Pulao"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Biryani"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Pulao"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Pulao"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Pulao"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Pulao"},
{"sno": 12, "name": "Chicken Pulao 500gm Single Boti", "price": "RS 1500", "category": "Pulao"},
{"sno": 13, "name": "Chicken Pulao 500gm Double Boti", "price": "RS 1800", "category": "Pulao"},
{"sno": 14, "name": "Chicken Pulao 1KG", "price": "RS 2500", "category": "Pulao"},
{"sno": 15, "name": "Pao Sada Pulao", "price": "RS 800", "category": "Pulao"},
{"sno": 16, "name": "Sada Pulao Single", "price": "RS 1000", "category": "Pulao"},
{"sno": 17, "name": "Sada Pulao 500gm", "price": "RS 1500", "category": "Pulao"},
{"sno": 18, "name": "Sada Pulao 1KG", "price": "RS 2000", "category": "Pulao"},
{"sno": 19, "name": "Chicken Karahi Half", "price": "RS 3000", "category": "Salan"},
{"sno": 20, "name": "Chicken Karahi Full", "price": "RS 5000", "category": "Salan"},
{"sno": 21, "name": "Chicken Kaleji Half", "price": "RS 2000", "category": "Salan"},
{"sno": 22, "name": "Chicken Kaleji Full", "price": "RS 3500", "category": "Salan"},
{"sno": 23, "name": "Qeema Half", "price": "RS 2500", "category": "Salan"},
{"sno": 24, "name": "Qeema Full", "price": "RS 4000", "category": "Salan"},
{"sno": 25, "name": "Daal Mach Half", "price": "RS 2000", "category": "Salan"},
{"sno": 26, "name": "Daal Mach Full", "price": "RS 3500", "category": "Salan"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Salan"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Salan"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Salan"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Salan"},
{"sno": 27, "name": "Channa Half", "price": "RS 1800", "category": "Salan"},
{"sno": 28, "name": "Channa Full", "price": "RS 3000", "category": "Salan"},
{"sno": 29, "name": "Laal Roti 1", "price": "RS 200", "category": "Roti"},
{"sno": 30, "name": "Naan 1", "price": "RS 200", "category": "Roti"},
{"sno": 31, "name": "Farmaishi Chapati 1", "price": "RS 300", "category": "Roti"},
{"sno": 32, "name": "Chai Cut", "price": "RS 500", "category": "Roti"},
{"sno": 33, "name": "Chai Full", "price": "RS 800", "category": "Roti"},
{"sno": 34, "name": "Laal Roti 5", "price": "RS 800", "category": "Roti"},
{"sno": 35, "name": "Naan 5", "price": "RS 800", "category": "Roti"},
{"sno": 36, "name": "Farmaishi Chapati 5", "price": "RS 1200", "category": "Roti"},
{"sno": 37, "name": "Raita", "price": "RS 400", "category": "Roti"},
{"sno": 38, "name": "Salad", "price": "RS 500", "category": "Roti"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Roti"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Roti"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Roti"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Roti"},
{"sno": 39, "name": "Cold Drink 345ml", "price": "RS 70", "category": "Drinks"},
{"sno": 40, "name": "Cold Drink 500ml", "price": "RS 90", "category": "Drinks"},
{"sno": 41, "name": "Cold Drink 1Ltrs", "price": "RS 150", "category": "Drinks"},
{"sno": 42, "name": "Cold Drink 1.5Ltrs", "price": "RS 180", "category": "Drinks"},
{"sno": 43, "name": "String 345ml", "price": "RS 70", "category": "Drinks"},
{"sno": 44, "name": "String 500ml", "price": "RS 90", "category": "Drinks"},
{"sno": 45, "name": "Slice Juice", "price": "RS 70", "category": "Drinks"},
{"sno": 46, "name": "Water 345ml", "price": "RS 30", "category": "Drinks"},
{"sno": 47, "name": "Water 500ml", "price": "RS 50", "category": "Drinks"},
{"sno": 48, "name": "Water 1.5Ltrs", "price": "RS 80", "category": "Drinks"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Drinks"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Drinks"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Drinks"},
{"sno": 5, "name": ".........................", "price": "......", "category": "Drinks"},
];
void _editDish(int index) {
  TextEditingController nameController = TextEditingController(text: dishes[index]['name']);
  TextEditingController priceController = TextEditingController(text: dishes[index]['price']);
  TextEditingController categoryController = TextEditingController(text: dishes[index]['category']);

  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: 350, // Reduced width
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Edit Dish",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF264653),
                ),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Dish Name",
                  prefixIcon: const Icon(Icons.restaurant, color: Color(0xFF2A9D8F)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),

              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Price",
                  prefixIcon: const Icon(Icons.money, color: Color(0xFFE76F51)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),

              TextField(
                controller: categoryController,
                decoration: InputDecoration(
                  labelText: "Category",
                  prefixIcon: const Icon(Icons.category, color: Color(0xFFF4A261)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel", style: TextStyle(fontSize: 16)),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        dishes[index]['name'] = nameController.text;
                        dishes[index]['price'] = priceController.text;
                        dishes[index]['category'] = categoryController.text;
                      });
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.save, color: Colors.white),
                    label: const Text("Save", style: TextStyle(fontSize: 16, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2A9D8F),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

/*
void _addNewDish() {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: 350, // Reduced width
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add New Dish",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF264653),
                ),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Dish Name",
                  prefixIcon: const Icon(Icons.restaurant, color: Color(0xFF2A9D8F)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),

              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Price",
                  prefixIcon: const Icon(Icons.money, color: Color(0xFFE76F51)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),

              TextField(
                controller: categoryController,
                decoration: InputDecoration(
                  labelText: "Category",
                  prefixIcon: const Icon(Icons.category, color: Color(0xFFF4A261)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel", style: TextStyle(fontSize: 16)),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        dishes.add({
                          "sno": dishes.length + 1,
                          "name": nameController.text,
                          "price": priceController.text,
                          "category": categoryController.text
                        });
                      });
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text("Add", style: TextStyle(fontSize: 16, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2A9D8F),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}*/
 @override
  Widget build(BuildContext context) {
    // Group dishes by category
    Map<String, List<Map<String, dynamic>>> groupedDishes = {};
    for (var dish in dishes) {
      if (!groupedDishes.containsKey(dish["category"])) {
        groupedDishes[dish["category"]] = [];
      }
      groupedDishes[dish["category"]]!.add(dish);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Dishes Management"),
        backgroundColor: const Color.fromARGB(255, 96, 140, 162),
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 1200, // Adjust table width to fit screen
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: groupedDishes.entries.map((entry) {
                  String category = entry.key;
                  List<Map<String, dynamic>> categoryDishes = entry.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Heading
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          category, // Category Name
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 4, 4, 4),
                          ),
                        ),
                      ),
                      Table(
                        columnWidths: const {
                          0: FixedColumnWidth(50),  // S.No
                          1: FlexColumnWidth(),     // Dish Name (Auto Adjust)
                          2: FixedColumnWidth(140), // Price
                          3: FixedColumnWidth(170), // Category
                          4: FixedColumnWidth(160), // Actions (Reduced Width)
                        },
                        border: TableBorder.all(color: Colors.grey.shade300),
                        children: [
                          // Table Header
                          const TableRow(
                            decoration: BoxDecoration(color: Color.fromARGB(255, 38, 50, 56)),
                            children: [
                              TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text("S.No", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
                              TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text("Dish Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
                              TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text("Price", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
                              TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text("Category", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
                              TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text("Actions", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
                            ],
                          ),
                          // Table Rows for each dish in the category
                          ...categoryDishes.asMap().entries.map((entry) {
                            int categoryIndex = entry.key + 1; // Start numbering from 1
                            Map<String, dynamic> dish = entry.value;
                            return TableRow(
                              decoration: BoxDecoration(
                                color: categoryIndex.isEven ? Colors.white : Colors.grey.shade100,
                              ),
                              children: [
                                TableCell(child: Padding(padding: const EdgeInsets.all(8), child: Text("$categoryIndex"))),
                                TableCell(child: Padding(padding: const EdgeInsets.all(8), child: Text(dish["name"]))),
                                TableCell(child: Padding(padding: const EdgeInsets.all(8), child: Text(dish["price"]))),
                                TableCell(child: Padding(padding: const EdgeInsets.all(8), child: Text(dish["category"]))),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () => _editDish(categoryIndex - 1), // Adjusted index
                                          icon: const Icon(Icons.edit, size: 16, color: Colors.white),
                                          label: const Text("Edit", style: TextStyle(fontSize: 12, color: Colors.white)),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}