
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/CatgoryByScreen/pages/categoryemptyscreen.dart';
import 'package:new_diy_beauty_products/CatgoryByScreen/provider/categorybyprovider.dart';
import 'package:new_diy_beauty_products/CatgoryByScreen/widgets/allcategorybywidget.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ExtraScreens/loadingscreen.dart';



import 'package:provider/provider.dart';


class AllCategoryEachScreen extends StatefulWidget {
  static const routeName = 'all_categorypackage_screen';
    final String catepackage;

  const AllCategoryEachScreen({
    Key? key,required this.catepackage
  }) : super(key: key);

  @override
  State<AllCategoryEachScreen> createState() => _AllCategoryEachScreenState();
}

class _AllCategoryEachScreenState extends State<AllCategoryEachScreen> {
  TextEditingController searchController=TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryEachProvider>(context, listen: false)
        .getAllEachCategorysData(context: context,categoryproduct: widget.catepackage);
        
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final catefilms= Provider.of<CategoryEachProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor:appcolor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Category Products',
              style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
            ),
         
          ],
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
         catefilms.category.isNotEmpty?Text('Category Products Nears You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text(''),
            //  cateproduct.category.isEmpty?Text(''): TextFormField(
            //     decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),fillColor: Colors.white,filled: true,hintText: 'Search',suffixIcon: Icon(Icons.search)),
            //       onChanged: (value) {
            //       if (value != "") {
            //         String searchQuery = value.toLowerCase();
            //         print("hhhhhhhhh");
            //         cateproduct.getSearchData(value: searchQuery);
            //       }
            //     },
            //   ),
              SizedBox(height: size.height*0.02),
              catefilms.loadingSpinner
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                           
                              const LoadingScreen(title: 'Loading'),
                              CircularProgressIndicator(
                                color: Colors.green,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                               
                           
                            ],
                          )
                           
                        : catefilms.category.isEmpty
                            ? const CategoryEmptyScreen()
                            : SizedBox(
                              height: size.height * 0.8,
                                child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 0.9),
                                  scrollDirection: Axis.vertical,
                                  itemCount: catefilms.category.length,
                                  itemBuilder: (context, intex) {
                                    return AllEachCategoryWidget(
                                      categoryid: catefilms.category[intex].id,
                                      productname: catefilms.category[intex].productName,
                                      image: catefilms.category[intex].image,

                                 
                                    
                                    );
                                  },
                                ),
                              ),
            ],
          ),
        ),
      ),     
    );
  }
}
