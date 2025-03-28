
import 'package:bismillah_biryani_pos/admin_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bismillah Biryani Center',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: const Color.fromARGB(255, 43, 42, 40),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F5F5),
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
      home: const POSScreen(),
    );
  }
}

class POSScreen extends StatefulWidget {
  const POSScreen({Key? key}) : super(key: key);

  @override
  State<POSScreen> createState() => _POSScreenState();
}

class _POSScreenState extends State<POSScreen> {
  final List<OrderItem> _orderItems = [];
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  void _addToOrder(String name, double price) {
    // Check if item already exists in order
    final existingItemIndex = _orderItems.indexWhere((item) => item.name == name);

    setState(() {
      if (existingItemIndex >= 0) {
        // Increment quantity if item already exists
        _orderItems[existingItemIndex].quantity++;
      } else {
        // Add new item to order
        _orderItems.add(OrderItem(name: name, price: price, quantity: 1));
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _orderItems.removeAt(index);
    });
  }

  void _updateQuantity(int index, int newQuantity) {
    if (newQuantity <= 0) {
      _removeItem(index);
    } else {
      setState(() {
        _orderItems[index].quantity = newQuantity;
      });
    }
  }

  double get _totalAmount {
    return _orderItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }


 void _showAdminLogin() {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Admin Login'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (usernameController.text == 'trust' && passwordController.text == '123') {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminDashboard()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Invalid credentials'), backgroundColor: Colors.red),
              );
            }
          },
          child: const Text('Login'),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}


////BILLL
  Future<void> _printBill() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: const PdfPageFormat(58 * PdfPageFormat.mm, double.infinity),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Restaurant name
              pw.Center(
                child: pw.Text(
                  'BPC PAKWAN CENTER',
                  style: pw.TextStyle(
                    fontSize: 13, // Smaller font size
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 6),

              // Bill details
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Bill #: ${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                  pw.Text(
                    'Date: ${_dateFormat.format(DateTime.now())}',
                    style: const pw.TextStyle(fontSize: 9), // Smaller font size
                  ),
                ],
              ),
              pw.SizedBox(height: 10), // Reduced spacing

              // Table for items
              pw.Container(
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(),
                  borderRadius: const pw.BorderRadius.all(pw.Radius.circular(5)),
                ),
                child: pw.Table(
                  border: pw.TableBorder.symmetric(
                    inside: const pw.BorderSide(width: 0.5),
                  ),
                  columnWidths: {
                   // 0: const pw.FixedColumnWidth(25), // Smaller column width
                    0: const pw.FlexColumnWidth(80), // Adjusted column width
                    1: const pw.FixedColumnWidth(23), // Smaller column width
                    2: const pw.FixedColumnWidth(33), // Smaller column width
                    3: const pw.FixedColumnWidth(46), // Smaller column width
                  },
                  children: [
                    // Table header
                    pw.TableRow(
                      decoration: const pw.BoxDecoration(
                        color: PdfColors.grey300,
                      ),
                      children: [
                      //  pw.Padding(
                         // padding: const pw.EdgeInsets.all(0.7), // Reduced padding----4
                         // child: pw.Text(
                          //  'S.No',
                          //  style: pw.TextStyle(
                          //    fontSize: 10, // Smaller font size
                          //    fontWeight: pw.FontWeight.bold,
                          //  ),
                         // ),
                      //  ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(1.0), // Reduced padding----4
                          child: pw.Text(
                            'ITEM',
                            style: pw.TextStyle(
                              fontSize: 10, // Smaller font size
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(1), // Reduced padding------4
                          child: pw.Text(
                            'QTY',
                            style: pw.TextStyle(
                              fontSize: 10, // Smaller font size
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(1), // Reduced padding-----4
                          child: pw.Text(
                            'RATE',
                            style: pw.TextStyle(
                              fontSize: 10, // Smaller font size
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(1), // Reduced padding----4
                          child: pw.Text(
                            'AMOUNT',
                            style: pw.TextStyle(
                              fontSize: 10, // Smaller font size ---8
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Table rows for each item
                    ..._orderItems.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      return pw.TableRow(
                        decoration: index % 2 == 0
                            ? const pw.BoxDecoration(color: PdfColors.grey100)
                            : null,
                        children: [
                         // pw.Padding(
                           // padding: const pw.EdgeInsets.all(4.0), // Reduced padding
                           // child: pw.Text(
                             // '${index + 1}',
                              //style: const pw.TextStyle(fontSize: 9), // Smaller font size
                           // ),
                       //   ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4.0), // Reduced padding
                            child: pw.Text(
                              item.name,
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, // Use pw.FontWeight instead of FontWeight
                                fontSize: 10, // Adjust font size
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4.0), // Reduced padding
                            child: pw.Text(
                              '${item.quantity}',
                              style: const pw.TextStyle(fontSize: 9), // Smaller font size
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4.0), // Reduced padding
                            child: pw.Text(
                              '${item.price}',
                              style: pw.TextStyle(
                               fontWeight: pw.FontWeight.bold, // Use pw.FontWeight instead of FontWeight
                                fontSize: 10, // Adjust font size
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4.0), // Reduced padding
                            child: pw.Text(
                              (item.price * item.quantity).toStringAsFixed(2),
                              style: const pw.TextStyle(fontSize: 9), // Smaller font size
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
              pw.SizedBox(height: 10), // Reduced spacing

              // Total amount
              pw.Container(
                alignment: pw.Alignment.centerRight,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Row(
                      mainAxisSize: pw.MainAxisSize.min,
                      children: [
                        pw.Container(
                          width: 80, // Adjusted width
                          child: pw.Text(
                            'TOTAL:',
                            style: pw.TextStyle(
                              fontSize: 10, // Smaller font size
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 60, // Adjusted width
                          child: pw.Text(
                            'Rs. ${_totalAmount.toStringAsFixed(2)}',
                            style: pw.TextStyle(
                              fontSize: 10, // Smaller font size
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 2), // Reduced spacing -----4

              // Powered by Trust Nexus
              pw.Center(
  child: pw.RichText(
    text: pw.TextSpan(
      children: [
        pw.TextSpan(
          text: 'Powered by ', // Normal text
          style: pw.TextStyle(
            fontSize: 11,
            fontStyle: pw.FontStyle.italic,
          ),
        ),
        pw.TextSpan(
          text: 'Trust Nexus', // Bold text
          style: pw.TextStyle(
            fontSize: 11,
            fontWeight: pw.FontWeight.bold,
            fontStyle: pw.FontStyle.italic,
          ),
        ),
      ],
    ),
  ),
),

              
              pw.SizedBox(height: 3),
              pw.Center(
                child: pw.Text(
                  'For Software Development: 0303-8184136',
                  style: pw.TextStyle(
                    fontSize: 8,
                    fontStyle: pw.FontStyle.italic,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );

    // Clear the order after printing
    setState(() {
      _orderItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0), // Adjusted height --120
        child: Container(
  decoration: BoxDecoration(
    color: Colors.white, // White background
    border: Border(
      bottom: BorderSide(
        width: 1.0, // Thin line
        color: Colors.grey.shade300, // Light grey color
      ),
    ),
  ),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 10, 10, 10),
            elevation: 0,
            toolbarHeight: 140,
            leadingWidth: 150, // Increased space for logo  --160
            leading: Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo Container
                  Container(
                    width: 170, //---130
                    height: 96,  //--60
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 15, 15, 15),
                      borderRadius: BorderRadius.circular(0),     
                 ),
                    child: Image.asset(
                      'black_logo.png',
                     // fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),//---5

                  
                ],
              ),
            ),

            // Centered Title
            title: const Text(
              'Bismillah Pakwan Center',
              style: TextStyle(
                fontSize: 50, // Adjusted for better UI
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            centerTitle: true,

            // Admin Login Button
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),  
                child: ElevatedButton.icon(
                  onPressed: _showAdminLogin,
                 icon: const Icon(Icons.admin_panel_settings, size: 40),
              label: const Text(
                'Admin Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Added bold font weight
                  fontSize: 18, // Keeping your previous font size
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 2, 66, 126),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              ),
            ]
          ),
        ),
      ),


      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.grey.shade100],
          ),
        ),
        child: Row(
          children: [
            // Menu Categories (75% of screen)
            Expanded(
              flex: 3,  //3
              child: Padding(
                padding: const EdgeInsets.all(10.0), ///12
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),///12,16
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.deblur_outlined, color: Color(0xFF1E3A8A)),
                          const SizedBox(width: 8),
                          const Text(
                    'Powered By: Trust Nexus\nContact: 0303-8184136',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12, // Adjusted for readability
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                          const Spacer(),
                          Text(
                            _dateFormat.format(DateTime.now()),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5), //12
                    // 4. Decrease font size and arrange in 3x2 grid
                    Expanded( ////FOR CARD SIZE
                      child: GridView.count(
                        crossAxisCount: 3, // 3 categories per row
                        childAspectRatio: 0.85, // Square aspect ratio 1.3
                        mainAxisSpacing: 1.0,  //10.0
                        crossAxisSpacing: 1.0,  //10.0
                        children: [
                          // First row of 3 categories
                          MenuCategory(
                            title: 'Biryani',
                            icon: Icons.rice_bowl,
                            color: const Color.fromARGB(255, 82, 3, 4),
                            items: const [
                              MenuItem(name: 'Chicken Biryani Pao', price: 140),
                              MenuItem(name: 'Chicken Biryani Single', price: 190),
                              MenuItem(name: 'Chicken Biryani 500gm Single Boti', price: 230),
                              MenuItem(name: 'Chicken Biryani 500gm Double Boti', price: 280),
                              MenuItem(name: 'Chicken Biryani 1KG', price: 560),
                              MenuItem(name: 'Sada Biryani Single', price: 140),
                              MenuItem(name: 'Sada Biryani 500gm', price: 180),
                              MenuItem(name: 'Sada Biryani 1KG', price: 360),
                              MenuItem(name: 'Biryani Box', price: 10),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                               MenuItem(name: '', price: 00),
                                MenuItem(name: '', price: 00),
                                 MenuItem(name: '', price: 00),
                                  MenuItem(name: '', price: 00),
                                  MenuItem(name: '', price: 00),
                                    MenuItem(name: '', price: 00),
                                     MenuItem(name: '', price: 00),
                                      MenuItem(name: '', price: 00),
                                        MenuItem(name: '', price: 00),
                            ],
                            onItemTap: _addToOrder,
                          ),
                          MenuCategory(
                            title: 'Pulao',
                            icon: Icons.dinner_dining,
                            color: const Color.fromARGB(255, 160, 131, 63),
                            items: const [
                              MenuItem(name: 'Pao Chicken Pulao', price: 140),
                              MenuItem(name: 'Chicken Pulao Single', price: 190),
                              MenuItem(name: 'Chicken Pulao 500gm Single Boti', price: 230),
                              MenuItem(name: 'Chicken Pulao 500gm Double Boti', price: 280),
                              MenuItem(name: 'Chicken Pulao 1KG', price: 560),
                              MenuItem(name: 'Pao Sada Pulao', price: 100),
                              MenuItem(name: 'Sada Pulao Single', price: 150),
                              MenuItem(name: 'Sada Pulao 500gm', price: 200),
                              MenuItem(name: 'Sada Pulao 1KG', price: 400),
                              MenuItem(name: 'Box', price: 10),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                               MenuItem(name: '', price: 00),
                                MenuItem(name: '', price: 00),
                                 MenuItem(name: '', price: 00),
                                  MenuItem(name: '', price: 00),
                                   MenuItem(name: '', price: 00),
                                    MenuItem(name: '', price: 00),
                                     MenuItem(name: '', price: 00),
                                      MenuItem(name: '', price: 00),
                                        MenuItem(name: '', price: 00),
                            ],
                            onItemTap: _addToOrder,
                          ),
                          MenuCategory(
                            title: 'Salan',
                            icon: Icons.soup_kitchen,
                            color: const Color.fromARGB(255, 7, 99, 88),
                            items: const [
                              MenuItem(name: 'Chicken Karahi Half', price: 160),
                              MenuItem(name: 'Chicken Karahi Full', price: 250),
                              MenuItem(name: 'Chicken Kaleji Half', price: 120),
                              MenuItem(name: 'Chicken Kaleji Full', price: 200),
                              MenuItem(name: 'Qeema Half', price: 120),
                              MenuItem(name: 'Qeema Full', price: 200),
                              MenuItem(name: 'Daal Mach Half', price: 90),
                              MenuItem(name: 'Daal Mach Full', price: 160),
                              MenuItem(name: 'Channa Half', price: 80),
                              MenuItem(name: 'Channa Full', price: 130),
                              MenuItem(name: 'Anda Channa Half', price: 130),
                              MenuItem(name: 'Anda Channa Full', price: 180),
                              MenuItem(name: 'Aalo Anda Half', price: 130),
                              MenuItem(name: 'Aalo Anda Full', price: 200),
                              MenuItem(name: 'Daal Channa Half', price: 80),
                              MenuItem(name: 'Daal Channa Full', price: 130),
                              MenuItem(name: 'Aalo Palak Half', price: 80),
                              MenuItem(name: 'Aalo Palak Full', price: 130),
                              MenuItem(name: 'Mix Sabzi Half', price: 130),
                              MenuItem(name: 'Mix Sabzi Full', price: 130),
                              MenuItem(name: '', price: 00),
                            ],
                            onItemTap: _addToOrder,
                          ),
                          // Second row of 3 categories
                           MenuCategory(
                            title: 'Extras',
                            icon: Icons.restaurant_menu,
                            color: const Color.fromARGB(255, 161, 97, 97),
                            items: const [
                              MenuItem(name: 'Raita', price: 40),
                              MenuItem(name: 'Salad', price: 30),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                               MenuItem(name: '', price: 00),
                                MenuItem(name: '', price: 00),
                                 MenuItem(name: '', price: 00),
                                  MenuItem(name: '', price: 00),
                                    MenuItem(name: '', price: 00),
                         ],
                            onItemTap: _addToOrder,
                          ),
                          MenuCategory(
                            title: 'Drinks',
                            icon: Icons.local_drink,
                            color: const Color.fromARGB(255, 243, 123, 48),
                            items: const [
                              MenuItem(name: 'Cold Drink 345ml', price: 70),
                              MenuItem(name: 'Cold Drink 500ml', price: 90),
                              MenuItem(name: 'Cold Drink 1Ltrs', price: 150),
                              MenuItem(name: 'Cold Drink 1.5Ltrs', price: 180),
                              MenuItem(name: 'String 345ml', price: 70),
                              MenuItem(name: 'String 500ml', price: 90),
                              MenuItem(name: 'Slice Juice', price: 70),
                              MenuItem(name: 'Water 345ml', price: 30),
                              MenuItem(name: 'Water 500ml', price: 50),
                              MenuItem(name: 'Water 1.5Ltrs', price: 80),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                               MenuItem(name: '', price: 00), 
                               MenuItem(name: '', price: 00),
                                MenuItem(name: '', price: 00),
                                 MenuItem(name: '', price: 00),
                                   MenuItem(name: '', price: 00),
                            ],
                            onItemTap: _addToOrder,
                          ),
                          // Add a sixth category (you can customize this)
                         
                          MenuCategory(
                            title: 'Roti',
                            icon: Icons.bakery_dining,
                            color: const Color.fromARGB(255, 63, 88, 53),
                            items: const [
                              MenuItem(name: 'Laal Roti 1', price: 10),
                              MenuItem(name: 'Naan 1', price: 15),
                              MenuItem(name: 'Farmaishi Chapati 1', price: 15),
                              MenuItem(name: 'Chai Cut', price: 30),
                              MenuItem(name: 'Chai Full', price: 50),
                              MenuItem(name: 'Laal Roti 5', price: 50),
                              MenuItem(name: 'Naan 5', price: 75),
                              MenuItem(name: 'Farmaishi Chapati 5', price: 75),
                              MenuItem(name: '', price: 40),
                              MenuItem(name: '', price: 30),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                               MenuItem(name: '', price: 00),
                                MenuItem(name: '', price: 00),
                                 MenuItem(name: '', price: 00),
                                  MenuItem(name: '', price: 00),
                                  MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                              MenuItem(name: '', price: 00),
                               MenuItem(name: '', price: 00),     
                            ],
                            onItemTap: _addToOrder,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Order Details (25% of screen)
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 249, 249),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 252, 251, 251).withOpacity(0.05), //--white
                      blurRadius: 5,
                      offset: const Offset(-2, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E3A8A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.receipt_long,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Order Details',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Items: ${_orderItems.length}',
                                style: const TextStyle(
                                  color: Color(0xFF1E3A8A),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _orderItems.clear();
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Clear',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),


                      // 3. Add header to order details section
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E3A8A).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Item Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Quantity',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Price',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),
                      Expanded(
                        child: _orderItems.isEmpty
                            ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No items added yet',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Click on menu items to add them',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        )
                            : Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: ListView.separated(
                            itemCount: _orderItems.length,
                            separatorBuilder: (context, index) => Divider(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                            itemBuilder: (context, index) {
                              final item = _orderItems[index];
                              return ListTile(
                                dense: true,
                                title: Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                  'Rs. ${item.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove_circle_outline, size: 20),
                                      color: Colors.red[400],
                                      onPressed: () => _updateQuantity(index, item.quantity - 1),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        '${item.quantity}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add_circle_outline, size: 20),
                                      color: Colors.green[400],
                                      onPressed: () => _updateQuantity(index, item.quantity + 1),
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Rs. ${(item.price * item.quantity).toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete_outline, size: 18),
                                          color: Colors.red[700],
                                          onPressed: () => _removeItem(index),
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          children: [
                            const Divider(height: 24), // Corrected Divider usage
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'TOTAL:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'Rs. ${_totalAmount.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xFF1E3A8A),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),


                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _orderItems.isEmpty ? null : () {
                                // Save record without printing
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Order saved successfully'),
                                    backgroundColor: Color(0xFF1E3A8A),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.save),
                              label: const Text('Save Record'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1E3A8A),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                disabledBackgroundColor: Colors.grey[300],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _orderItems.isEmpty ? null : _printBill,
                              icon: const Icon(Icons.print),
                              label: const Text('Print Bill'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[700],
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                disabledBackgroundColor: Colors.grey[300],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String name;
  final double price;

  const MenuItem({
    required this.name,
    required this.price,
  });
}

class OrderItem {
  final String name;
  final double price;
  int quantity;

  OrderItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class MenuCategory extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<MenuItem> items;
  final Function(String, double) onItemTap;

  const MenuCategory({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.items,
    required this.onItemTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(6.0), ///6.0 ----card
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), //--12
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
           padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0), // Decreased padding  
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),  //---12
                topRight: Radius.circular(10),   //---12
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 20, // Decreased icon size  ----16
                ),
                const SizedBox(width: 6), // Decreased spacing 
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13, 
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0), // Decreased padding ----6
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 2 items per row
                  childAspectRatio: 2.3, // Make buttons wider than tall   ---2.0
                  crossAxisSpacing: 4,      ///2
                  mainAxisSpacing: 4,     ///3
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _buildMenuItemButton(items[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItemButton(MenuItem item) {
    return Card(
      margin: const EdgeInsets.all(2.0), // Decreased margin  --2.0
      elevation: 2, // Decreased elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6), // Decreased border radius
      ),
      child: InkWell(
        onTap: () => item.name.isNotEmpty ? onItemTap(item.name, item.price) : null,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.all(4), // Decreased padding  ----4
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color,
                color.withOpacity(0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 9, // Decreased font size
                    height: 1.0, // text height -----1.1
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 4.0), // Decreased spacing   ----2
           
              Container(
                padding: const EdgeInsets.symmetric(horizontal:1, vertical: 1), // Decreased padding 1,1
              //  decoration: BoxDecoration(
                //  color: Colors.white.withOpacity(0.3),
                //  borderRadius: BorderRadius.circular(3),    //---10
               // ),
                child: Text(
                  item.name.isNotEmpty ? 'Rs. ${item.price.toStringAsFixed(0)}' : '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10, // Decreased font size
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}