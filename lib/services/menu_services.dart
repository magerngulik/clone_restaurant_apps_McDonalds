import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuServices {
  static deleteMenuItem(String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection("menu_item")
          .doc(uid)
          .delete();
    } catch (e) {
      debugPrint("Gagal Update: Gagal Update");
    }
  }

  static updateMenuItem(
      {required String uid,
      required String title,
      required String image,
      required int price,
      required String menuid}) async {
    try {
      await FirebaseFirestore.instance.collection("menu_item").doc(uid).update({
        "menu_title": title,
        "photo": image,
        "price": price,
        "uid": menuid,
      });
    } catch (e) {
      debugPrint("status: Gagal Update");
    }
  }

  static addCompleteOrder({required Map item}) async {
    await FirebaseFirestore.instance.collection("complete_order").add({
      "created_at": DateTime.now(),
      "item_order": item,
    });
  }

  static deleteMenuOrder(String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection("order_list")
          .doc(uid)
          .delete();
    } catch (e) {
      debugPrint("Status: Gagal Hapus");
    }
  }

  static var menu_list = [
    {
      "uid": "1",
      "menu_name": "Happy meal",
      "img_photo":
          "https://media.npr.org/assets/img/2013/09/26/ap110725132481-64efa1b0559d2ba8f38c7f6aaa9b96221806903b-s1100-c50.jpg"
    },
    {
      "uid": "2",
      "menu_name": "Menu Utama",
      "img_photo":
          "https://hargamenu.net/wp-content/uploads/2018/07/Menu-McD-Terbaik-Yang-Paling-Banyak-Disukai.png"
    },
    {
      "uid": "3",
      "menu_name": "Promosi",
      "img_photo":
          "https://png.pngtree.com/png-vector/20200113/ourlarge/pngtree-special-offer-discount-gold-circle-label-tag-for-sale-promotion-png-image_2127850.jpg"
    },
    {
      "uid": "4",
      "menu_name": "Pilihan Hemat",
      "img_photo":
          "https://daftarpaket.co.id/wp-content/uploads/2021/01/Menu-Sarapan-atau-Breakfast.jpg"
    },
    {
      "uid": "5",
      "menu_name": "Family Meal",
      "img_photo":
          "https://nos.jkt-1.neo.id/mcdonalds/foods/June2022/2Y9GIiZfQQnJ1MYP08co.png"
    },
    {
      "uid": "6",
      "menu_name": "Snack",
      "img_photo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvju4CIAMQVSgAtM7HYZ-W-H7L3wLzBScfxA&usqp=CAU"
    },
    {
      "uid": "7",
      "menu_name": "Minuman",
      "img_photo":
          "https://nos.jkt-1.neo.id/mcdonalds/foods/September2019/4ANlG5rmRU06y7H2hgos.png"
    },
  ];

  static var bennerMenu = [
    "https://cashbac.com/blog/wp-content/uploads/2021/03/cashbac-mcdonalds-bri-direct-debit-50-selasa-banner.jpg",
    "https://nos.jkt-1.neo.id/mcdonalds/promos/December2021/IUmeKMRY6das5RiGHUvN.jpg"
  ];
}
