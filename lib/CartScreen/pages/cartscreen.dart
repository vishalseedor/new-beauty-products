
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:new_diy_beauty_products/CartScreen/pages/cartemptyscreen.dart';
import 'package:new_diy_beauty_products/CartScreen/pages/ordersuccessscreen.dart';
import 'package:new_diy_beauty_products/CartScreen/provider/cartprovider.dart';
import 'package:new_diy_beauty_products/CartScreen/widgets/cartitem.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ExtraScreens/loadingscreen.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';

import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';



class CartScreen extends StatefulWidget {
    static const routeName = 'all_carts_screen';

 const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Map<String, dynamic>? paymentIntent;
  bool isLoading = false;
  @override
  void initState() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Provider.of<CartProvider>(context, listen: false)
        .getAllCartsData(context: context, userid: userProvider.currentUserId);
    Provider.of<UserProvider>(context, listen: false)
        .getUsertData(context: context);

    super.initState();
  }

  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final userData = Provider.of<UserProvider>(context);
    double totalPrice = cart.calculateTotalPrice();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        backgroundColor: appcolor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'My Cart',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 35,
              width: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    cart.clearCart(userid: userData.currentUserId);
                  },
                  child: Center(
                      child: Text(
                    'Clear',
                    style: TextStyle(
                        color:appcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ))),
            ),
          )
        ],
      ),
      body:isLoading? Center(child: Column(
        children: [CircularProgressIndicator(),
        SizedBox(height: size.height * 0.06,),
        Text("Payment is loading please wait...")],
      ),): Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1500),
                    child: cart.loadingSpinner
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const LoadingScreen(title: 'Loading'),
                              CircularProgressIndicator(
                                color: appcolor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          )
                        : cart.carts.isEmpty
                            ? const CartEmptyScreen()
                            : SizedBox(
                                height: size.height * 0.8,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: cart.carts.length,
                                  itemBuilder: (context, intex) {
                                    return CartItem(
                        index: intex,
                       
                        cartid: cart.carts[intex].cartId,
                         productid:cart.carts[intex].quantity,
                          image: cart.carts[intex].image, 
                          quanity:cart.carts[intex].quantity, 
                          price: cart.carts[intex].price, 
                          productname: cart.carts[intex].productName);

                                  },
                                ),
                              ),
                  ),
                ],
              ),
            ),
          ),
          cart.carts.isEmpty
              ? const Text('')
              : Container(
                  color: Colors.grey[100],
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      // shape: const RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(25),
                      //         topRight: Radius.circular(25))),
                      height: size.height * 0.15,

                      width: size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Item Total',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.fade,
                                ),
                                Text(
                                  "₹ .${cart.calculateTotalPrice().toString()}",
                                  style: TextStyle(
                                    color: appcolor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  overflow: TextOverflow.fade,
                                ),
                              ],
                            ),
                           
                            GestureDetector(
                              onTap: () async {
                                // payment();
                                Razorpay razorpay = Razorpay();
                                var options = {
                                  'key': 'rzp_test_1DP5mmOlF5G5ag',
                                  'amount': cart.totalAmount * 100,
                                  'name': 'DIY Beauty Products and Tips',
                                  'description': 'Fine T-Shirt',
                                  'retry': {'enabled': true, 'max_count': 1},
                                  'send_sms_hash': true,
                                  'prefill': {
                                    'contact': '8888888888',
                                    'email': 'test@razorpay.com'
                                  },
                                  'external': {
                                    'wallets': ['paytm']
                                  }
                                };
                                razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                                    handlePaymentErrorResponse);
                                razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                                    handlePaymentSuccessResponse);
                                razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                                    handleExternalWalletSelected);
                                razorpay.open(options);
                              },
                              child: Container(
                                height: size.height * 0.05,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: appcolor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.delivery_dining,color: Colors.white,),
                                    SizedBox(width: size.width*0.02),
                                    Text(
                                      'Place Order',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

// Future<void>payment()async{
// try{
//   Map<String ,dynamic>body={

//     'amount':100.00,
//     'currency':'INR',

//   };
//   var response =await http.post(
//     Uri.parse('https://api.stripe.com/v1/payment_intents'),
//     headers:{
//       'Authorization':'Bearer',
//       'Content-type':'application/x-www-form-urlencoded'

//     }
//   );
//   paymentIntent=json.decode(response.body);
// }catch(error){
//   throw Exception(error);
// }
//  await Stripe.instance.initPaymentSheet(paymentSheetParameters:SetupPaymentSheetParameters(
//   paymentIntentClientSecret: paymentIntent!['client_secret'],
//   style: ThemeMode.light,
//   merchantDisplayName: 'Vishal'
//  )
//  ).then((value) => {});
//  try{
//   await Stripe.instance.presentPaymentSheet().then((value) =>{
//     print('Payment successfully')
//   } );
//  }catch(error){

//  }

//   }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    isLoading = true;
    setState(() {

    });
    await context
        .read<CartProvider>()
        .placeOrderApi(userid: userProvider.currentUserId).then((value) {
           isLoading = false;
    setState(() {

    });
        });
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const OrderSuccessScreen()));
    print(response.data.toString());
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
