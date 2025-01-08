import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'ThanhToan.dart';
import 'GioHang.dart';
import 'ThongTinNguoiDung.dart';
import 'DangNhap.dart';
import 'DangKy.dart';
import 'LichSuDonHang.dart';


void main() {
  runApp(const MainApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior{
  const MyCustomScrollBehavior();

  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse
  };
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MyCustomScrollBehavior(),
      initialRoute: '/thongTinNguoiDung',
      routes: {
        '/thanhToan': (context) => ManHinhThanhToan(),
        '/gioHang': (context) => ManHinhGioHang(),
        '/thongTinNguoiDung': (context) => ManHinhThongTinNguoiDung(),
        '/dangKy': (context) => const SignUpScreen(),
        '/dangNhap': (context) => const LoginScreen(),
        '/lichSuDonHang': (context) => OrderScreen(),

      },
    );
  }
}