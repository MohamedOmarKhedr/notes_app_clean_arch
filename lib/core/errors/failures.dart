import 'package:hive_flutter/hive_flutter.dart';

abstract class Failure {
  
final String errMessage;

  const Failure(this.errMessage);
}

final class LocalDataFailure extends Failure {
  LocalDataFailure(super.errMessage);

  factory LocalDataFailure.fromHiveError(HiveError hiveError) {

    // إذا كانت الرسالة تشير إلى عدم وجود صندوق أو عدم فتحه
    if (hiveError.message.contains('Box not found') || hiveError.message.contains('is not opened')) {
      return LocalDataFailure('Hive box not found or not opened. Please ensure the box is opened before use.');
    }
    // إذا كانت الرسالة تشير إلى فساد البيانات
    else if (hiveError.message.contains('corrupted')) {
      return LocalDataFailure('Hive box is corrupted. You might need to delete and recreate it.');
    }
    // إذا كانت الرسالة تشير إلى عدم تهيئة Hive
    else if (hiveError.message.contains('Hive is not initialized')) {
      return LocalDataFailure('Hive is not initialized. Please call Hive.init() before any Hive operations.');
    }
    // إذا كانت الرسالة تشير إلى مفتاح مكرر (عادة مع putIfAbsent)
    else if (hiveError.message.contains('key already exists')) {
      return LocalDataFailure('A key with the same value already exists in the Hive box.');
    }
    // إذا كانت الرسالة تشير إلى مشكلة في الوصول/الأذونات
    else if (hiveError.message.contains('permission denied') || hiveError.message.contains('read-only')) {
      return LocalDataFailure('Permission denied for Hive operation. Check storage permissions.');
    }
    // **NEW:** أضف شرطًا لرسائل الخطأ التي قد تشير إلى مساحة تخزين ممتلئة.
    // لاحظ أن HiveError قد لا يكون صريحًا جدًا هنا، وقد تحتاج إلى اختبار.
    else if (hiveError.message.contains('No space left on device') || hiveError.message.contains('disk is full')) {
      return LocalDataFailure('Device storage is full. Please free up some space and try again. 📱');
    }
    // خطأ عام غير محدد في Hive
    else {
      return LocalDataFailure('An unknown Hive error occurred: ${hiveError.message}');
    }
  }
}