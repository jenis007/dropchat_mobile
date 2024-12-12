import 'dart:io';

import 'package:contacts_service/contacts_service.dart';
import 'package:dropchats/screen/AuthScreen/controller/contact_controller.dart';
import 'package:dropchats/utils/app_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ContactScreen extends StatefulWidget {
  // Change to StatelessWidget
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final controller = Get.put(ContactController());
  FocusNode searchFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    controller.requestContactsPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     leading: Padding(
      //       padding: const EdgeInsets.all(10),
      //       child: BackBtn(
      //         onTap: () {
      //           Get.back();
      //         },
      //       ),
      //     ),
      //     centerTitle: true,
      //     title: Text(
      //       StrKeys.invite.tr,
      //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
      //     )),
      extendBodyBehindAppBar: true,
      body: StatefulBuilder(
          builder: (context, setState) => Obx(
                () {
                  return controller.isPermissionGranted.value
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 24.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              // CommonTextField(
                              //   // Attach the focus node here
                              //   prefixIcon: SvgPicture.asset(LocalAssets.searchIcon),
                              //   textFieldController: controller.searchController,
                              //   textInputAction: TextInputAction.done,
                              //   hintText:StrKeys.Search.tr ,
                              //   contentPadding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                              //   onChanged: (value) => setState(() {}),
                              // ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Obx(() {
                                if (controller.isPermissionGranted.value) {
                                  return Expanded(
                                    child: controller.allContacts.isEmpty
                                        ? const Center(
                                            child: CupertinoActivityIndicator())
                                        : controller.allContacts
                                                .getContacts(controller
                                                    .searchController.text)
                                                .isEmpty
                                            ? const Center(
                                                child: Text(
                                                  'Contacts Not Founds',
                                                ),
                                              )
                                            : ListView.builder(
                                                physics: const ScrollPhysics(),
                                                padding: EdgeInsets.zero,
                                                itemCount: controller
                                                    .allContacts
                                                    .getContacts(controller
                                                        .searchController.text)
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  Contact contact = controller
                                                      .allContacts
                                                      .getContacts(controller
                                                          .searchController
                                                          .text)[index];
                                                  controller.isSelected.value =
                                                      controller
                                                          .selectedContacts
                                                          .contains(contact);
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      if (contact.displayName !=
                                                              null &&
                                                          contact.phones!
                                                              .isNotEmpty)
                                                        ListTile(
                                                          contentPadding:
                                                              EdgeInsets.zero,
                                                          leading: Container(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            height: 50.h,
                                                            width: 45.w,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            35)),
                                                            child: Center(
                                                              child: Text(
                                                                (contact.displayName !=
                                                                            null &&
                                                                        contact
                                                                            .displayName!
                                                                            .isNotEmpty)
                                                                    ? '${contact.displayName![0]}${(contact.familyName != null && contact.familyName!.isNotEmpty) ? '${contact.familyName![0]}' : ''}'
                                                                    : '?',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ),
                                                          // SizedBox(
                                                          //   height: 50.0,
                                                          //   width: 50.0,
                                                          //   child: HexagonWidget.flat(
                                                          //     cornerRadius: 10,
                                                          //     color: Colors.red,
                                                          //     width: 50.0, // Specify a width for better appearance
                                                          //     child: Text(
                                                          //       contact.displayName != null && contact.displayName!.isNotEmpty ? contact.displayName![0] : '?',
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                          title: Text(contact
                                                                  .displayName ??
                                                              'No Name'),
                                                          subtitle: contact
                                                                  .phones!
                                                                  .isNotEmpty
                                                              ? Text(contact
                                                                      .phones!
                                                                      .first
                                                                      .value ??
                                                                  '')
                                                              : const Text(
                                                                  'No phone number'),
                                                          // trailing: Check(
                                                          //   onChange: (value) {
                                                          //     if (!value) {
                                                          //       controller
                                                          //           .selectedContacts
                                                          //           .removeWhere(
                                                          //               (element) {
                                                          //         if (element.phones
                                                          //                     ?.isNotEmpty ==
                                                          //                 true ||
                                                          //             contact.phones
                                                          //                     ?.isNotEmpty ==
                                                          //                 true) {
                                                          //           return element
                                                          //                   .phones
                                                          //                   ?.first
                                                          //                   .value ==
                                                          //               contact
                                                          //                   .phones
                                                          //                   ?.first
                                                          //                   .value;
                                                          //         }
                                                          //         return false;
                                                          //       });
                                                          //     } else {
                                                          //       controller
                                                          //           .selectedContacts
                                                          //           .add(
                                                          //               contact);
                                                          //       controller
                                                          //           .update();
                                                          //     }
                                                          //   },
                                                          // ),
                                                        ),
                                                      if (controller.allContacts
                                                                  .length !=
                                                              1 &&
                                                          contact.displayName !=
                                                              null &&
                                                          contact.phones!
                                                              .isNotEmpty)
                                                        const Divider(),
                                                    ],
                                                  );
                                                },
                                              ),
                                  );
                                } else {
                                  return Center(
                                    child: Text('Not Pemissions'),
                                  );
                                }
                              }),
                              SizedBox(
                                height: 5.h,
                              ),

                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Obx(() => Text(
                              //       '${controller.selectedContacts.length} ${StrKeys.Selected.tr ?? ''}',
                              //       style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
                              //     )),
                              //     CommonAnimatedButton(
                              //       height: 18.w,
                              //       width: 45.w,
                              //       onTap: () {
                              //         if (controller.selectedContacts.isNotEmpty) {
                              //           controller.datas.addAll({'contect': controller.selectedContacts.toList()});
                              //           Get.toNamed(
                              //             RouteNames.contactMsgScreen,
                              //             arguments: controller.datas,
                              //           );
                              //         }else{
                              //           MyToasts.warningToast(toast: StrKeys.validation.tr,);
                              //         }
                              //       },
                              //       childText: StrKeys.next.tr,
                              //       isActive: true,
                              //       isSmallActiveBtn: true,
                              //     ),
                              //   ],
                              // ),
                              (Platform.isAndroid)
                                  ? SizedBox(
                                      height: 1.h,
                                    )
                                  : SizedBox(
                                      height: 0.h,
                                    ),
                            ],
                          ),
                        )
                      : const Text((''));
                },
              )),
    );
  }
}

class Check extends StatefulWidget {
  const Check({super.key, required this.onChange});

  final void Function(bool value) onChange;

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> with AutomaticKeepAliveClientMixin {
  bool isSelected = false;

  void changeState() {
    isSelected = !isSelected;
    widget.onChange(isSelected);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkResponse(
      onTap: () => changeState(),
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6), // Rounded corners
          border: Border.all(
            color: isSelected ? Colors.black : Colors.black, // Black border
            width: 2, // Border width
          ),
          color: isSelected
              ? Colors.black
              : Colors
                  .transparent, // Black when selected, transparent otherwise
        ),
        width: 24,
        height: 24,
        child: isSelected
            ? const Icon(
                Icons.check, // Check icon when selected
                color: Colors.white,
                size: 15,
              )
            : null, // No icon when not selected
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
