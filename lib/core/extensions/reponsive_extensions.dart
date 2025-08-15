import 'package:flutter/material.dart';

extension ResponsiveDimensions on BuildContext {
  /// ارتفاع الشاشة
  double get height => MediaQuery.of(this).size.height;
  
  /// عرض الشاشة
  double get width => MediaQuery.of(this).size.width;
  
  /// نسبة من ارتفاع الشاشة (0.01 إلى 1.0)
  double heightPercent(double percent) => height * percent;
  
  /// نسبة من عرض الشاشة (0.01 إلى 1.0)
  double widthPercent(double percent) => width * percent;
  
  /// تحديد إذا كانت الشاشة عمودية
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
}


extension ResponsiveText on BuildContext {
  /// حجم الخط المتجاوب بناء على حجم الشاشة
  double responsiveTextSize(double size) {
    final shortestSide = MediaQuery.of(this).size.shortestSide;
    
    // معادلة لضبط حجم الخط
    if (shortestSide > 600) {
      return size * 1.3; // زيادة حجم الخط للأجهزة الكبيرة
    } else if (shortestSide > 400) {
      return size * 1.1; // زيادة متوسطة
    }
    return size; // الحجم الأساسي للهواتف
  }
}


extension ResponsivePadding on BuildContext {
  /// EdgeInsets متجاوب مع الشاشة
  EdgeInsets responsivePadding({
    double horizontal = 2.0,
    double vertical = 2.0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: width * (horizontal / 100),
      vertical: height * (vertical / 100),
    );
  }
  
  /// Spacer متجاوب
  SizedBox responsiveSpacer({double multiplier = 1.0}) {
    return SizedBox(height: height * (0.02 * multiplier));
  }
}


extension ResponsiveGrid on BuildContext {
  /// عدد الأعمدة المتجاوب حسب حجم الشاشة
  int get responsiveGridCount {
    if (width > 1200) return 2; // شاشات كبيرة
    if (width > 800) return 1;  // أجهزة لوحية
    if (width > 600) return 1;  // أجهزة لوحية صغيرة
    return 1; // هواتف
  }
  
  /// تباعد متجاوب بين عناصر الـ Grid
  double get responsiveGridSpacing => width * 0.02;
}



extension FoldableExtensions on BuildContext {
  /// هل الجهاز به شاشة قابلة للطي؟
  bool get isFoldable => MediaQuery.of(this).displayFeatures.isNotEmpty;
  
  /// هل الجهاز في الوضع المفتوح؟
  bool get isFoldableOpen {
    if (!isFoldable) return false;
    final hinge = MediaQuery.of(this).displayFeatures.first;
    return hinge.bounds.size.width > 0 || hinge.bounds.size.height > 0;
  }
}

enum DeviceType { mobile, tablet, desktop }


extension LayoutExtensions on BuildContext {
  /// نوع الجهاز بناء على حجم الشاشة
  DeviceType get deviceType {
    final width = MediaQuery.of(this).size.width;
    if (width < 600) return DeviceType.mobile;
    if (width < 900) return DeviceType.tablet;
    return DeviceType.desktop;
  }
  
  /// بناء ويدجت مختلفة حسب نوع الجهاز
  Widget responsiveLayout({
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  }) {
    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
    }
  }
}

