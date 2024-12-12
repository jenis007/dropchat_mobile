import 'package:contacts_service/contacts_service.dart';
import 'package:dropchats/constant/app_color.dart';
import 'package:dropchats/utils/app_snackbar.dart';
import 'package:dropchats/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactController extends GetxController {
  RxList<Contact> allContacts = <Contact>[].obs; // Observable list
  var isPermissionGranted = false.obs; // Observable for permission status
  var selectedContacts = <Contact>[].obs; // List of selected contacts
  TextEditingController searchController = TextEditingController();
  Map<String, dynamic> datas = {};

  RxBool isSelected = false.obs;
  @override
  void onInit() {
    getArgument();
    requestContactsPermission();
    super.onInit();
  }

  void getArgument() {
    debugPrint("getArgument");
    Map<String, dynamic>? getArgue = Get.arguments;

    if (getArgue != null) {
      datas = getArgue;
      debugPrint("passData: $datas");
    }
  }

  Future<void> requestContactsPermission() async {
    PermissionStatus permissionStatus = await Permission.contacts.status;

    if (permissionStatus.isDenied ||
        permissionStatus.isRestricted ||
        permissionStatus.isPermanentlyDenied) {
      permissionStatus = await Permission.contacts.request();
    }

    if (permissionStatus.isPermanentlyDenied) {
      await alertDialog();
    }

    if (permissionStatus.isGranted) {
      isPermissionGranted.value = true;
      fetchContacts();
    } else {
      isPermissionGranted.value = false;
      MyToasts.warningToast(toast: 'please give Contact Permissions');
      Get.back();
    }
  }

  void toggleSelection(Contact contact) {
    if (selectedContacts.contains(contact)) {
      selectedContacts.remove(contact); // Deselect contact
    } else {
      selectedContacts.add(contact); // Select contact
    }
  }

  Future<void> per() async {
    PermissionStatus permissionStatus = await Permission.contacts.status;
    if (permissionStatus.isPermanentlyDenied) {
      await openAppSettings();
      MyToasts.warningToast(
        toast: 'please give Contact Permissions',
      );
    }
  }

  Future<void> alertDialog() async {
    await Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Text(
        'Contact Permission Required',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.blackColor,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      content: Text(
        'Oops! It looks like we need access to your contacts to enhance your app experience. Please enable contact permissions in your device settings to unlock all features. Go to Settings > App Permissions > Contacts. Thank you!',
        style: TextStyle(
          fontSize: 10.5.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.noti,
        ),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButton(
              buttonColor: AppColor.appPrimaryColor,
              textColor: AppColor.whiteColor,
              title: 'Cancle',
              onTap: () {
                Get.back();
              },
            ),
            CommonButton(
              buttonColor: AppColor.appPrimaryColor,
              textColor: AppColor.whiteColor,
              title: 'Setting',
              onTap: () async {
                await per();
                Get.back();
              },
            ),
          ],
        ),
        SizedBox(
          height: 1.5.h,
        )
      ],
    ));
  }

  bool isSelecteds(Contact contact) {
    return selectedContacts.contains(contact);
  }

  Future<void> fetchContacts() async {
    Iterable<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: true);
    allContacts.value = contacts.toList(); // Update the observable list
    update();
  }
}
