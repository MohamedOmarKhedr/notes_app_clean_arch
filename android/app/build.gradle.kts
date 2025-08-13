plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.notes_app_clean_arch"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973" // تأكد من تثبيت هذا الإصدار من NDK عبر Android Studio SDK Manager

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.notes_app_clean_arch"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 21
        targetSdk = 34
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            isShrinkResources = true
            isMinifyEnabled = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    splits {
        abi {
            // تفعيل تقسيم الـ APK بناءً على ABI (الصيغة الصحيحة في Kotlin DSL)
            isEnable = true
            reset() // هذا جيد للتأكد من عدم وجود إعدادات سابقة غير مرغوبة
            // قم بتضمين المعماريات التي تريد دعمها. استخدام أقواس وقيم نصية مزدوجة "
            include("armeabi-v7a", "arm64-v8a", "x86", "x86_64")
            // إذا كنت لا تريد إنشاء APK عالمي (universal APK) يضم كل المعماريات
            // الصيغة الصحيحة في Kotlin DSL
            isUniversalApk = false
        }
    }
}

flutter {
    source = "../.."
}