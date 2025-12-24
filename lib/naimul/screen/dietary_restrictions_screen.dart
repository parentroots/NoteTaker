import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_taker/naimul/screen/kithen_equipment_screen.dart';

class DietaryRestrictionsScreen extends StatefulWidget {
  const DietaryRestrictionsScreen({super.key});

  @override
  State<DietaryRestrictionsScreen> createState() =>
      _DietaryRestrictionsScreenState();
}

class _DietaryRestrictionsScreenState
    extends State<DietaryRestrictionsScreen> {



  final List<String> categories = ['Halal', 'Vegan', 'Roasted'];
  final List<String> selectedCategories = [];

  void onTapEditButton() {
    Get.to( {

      Get.to(KitchenEquipmentScreen())
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                onTapEditButton();
              },
              child: Container(
                height: 40.h,
                width: 74.w,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF3F3F3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.black,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "Edit",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),

            const Text(
              'Dietary Restrictions and\nAllergies',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 24.h),

            const Text(
              'DIETARY RESTRICTIONS',
              style: TextStyle(fontSize: 12, color: Color(0xFF777777)),
            ),

            const SizedBox(height: 12),


            CustomDropdown(
              dropdownHeight: 170,

              dropdown: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: categories.map((item) {
                    final isSelected =
                    selectedCategories.contains(item);

                    return CheckboxListTile(
                      value: isSelected,
                      title: Text(item),
                      controlAffinity:
                      ListTileControlAffinity.leading,
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            selectedCategories.add(item);
                          } else {
                            selectedCategories.remove(item);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),



              child: Container(
                height: 48,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFF2F2F2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedCategories.isEmpty
                          ? 'Select Category'
                          : selectedCategories.join(', '),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF777777),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ),
            ),

            SizedBox(height: 28.h,),

            Text('ALLERGIES',style: TextStyle(
              fontSize:12.sp,
              color: Color(0xff777777)
            ),),
            
            SizedBox(height: 12.h,),
            
            buildSearchSection(),

            SizedBox(height: 12.h,),


            Expanded(
              child: ListView.separated(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12.h),
                    height: 130,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color(0xFFF2F2F2)

                    ),

                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Text('Peanuts',style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF272727)
                            ),),

                            SizedBox(height: 4.h,),

                            Text('No specific details',style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xFF777777)
                            ),),


                            SizedBox(height: 24.h,),

                            Row(
                              children: [

                                SizedBox(width: 14,),

                                Icon(Icons.edit_note),

                                Text('Edit Item',style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF272727)
                                ),)
                              ],
                            )
                            
                          ],
                        ),


                        Container(
                          height: 89.h,
                          width: 92.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.purple
                          ),
                        )

                      ],
                    ),
                  );
                }, separatorBuilder: (context, index) {
                return SizedBox(height: 12.h,);
              },),
            )




          ],
        ),
      ),
    );
  }

  Container buildSearchSection() {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 18.h),
            height: 60.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color(0xFFF2F2F2),
              borderRadius: BorderRadius.circular(12)
            ),

            child: Row(
              children: [
                Icon(Icons.search,color: Color(0xff272727),),
                Expanded(
                  child: TextFormField(
                   style: TextStyle(
                     fontSize: 14.sp,
                     color: Color(0xFF777777)
                   ),
                    decoration: InputDecoration(
                      hintText: 'Search....',
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF777777)
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),

                  ),
                )

              ],
            ),
          );
  }
}

/// ================================================Custom Drop Down Button=========================

class CustomDropdown extends StatefulWidget {
  final Widget child;
  final Widget dropdown;
  final double dropdownHeight;

  const CustomDropdown({
    super.key,
    required this.child,
    required this.dropdown,
    this.dropdownHeight = 180,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _toggle() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlay();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _remove();
    }
  }

  void _remove() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlay() {
    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _remove,
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width - 32,
              child: CompositedTransformFollower(
                link: _layerLink,
                offset: const Offset(0, 8),
                child: Material(
                  color: Colors.transparent,
                  child: widget.dropdown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggle,
        child: widget.child,
      ),
    );
  }
}
