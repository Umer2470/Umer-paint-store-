# Review and optimize the existing app/proguard-rules.pro file for CH UMAIR SENTRY STORE.

IMPORTANT:
- Do NOT remove existing app functionality.
- Do NOT change UI or business logic.
- Do NOT add new features.
- Keep Room/SQLite database and all @Entity/@Dao functionality safe.
- Keep the Secure API Connection Layer working.
- Keep Developer Mode/Developer Panel working.
- Keep Retrofit, OkHttp and Moshi serialization working.
- Keep PDF invoice, barcode, printing, WhatsApp, attendance, POS, inventory, purchases, customers, suppliers, reports, cash book, expenses and backup/restore functionality working.
- Keep release APK compact; avoid unnecessarily broad -keep rules.
- Do NOT use "-keep class ** { *; }".

First inspect the actual source code and package structure before changing rules.

Optimize the existing rules:
1. Preserve RoomDatabase subclasses, @Entity classes and required Room generated/runtime classes.
2. Preserve only the application data models/DTOs that actually require reflection or serialization.
3. Preserve Retrofit API interfaces and required annotations.
4. Preserve Moshi models/annotations that are actually used.
5. Preserve Security/Keystore classes only where required.
6. Keep Developer API, License, Sync and SecureIdentity models only where reflection/serialization requires them.
7. Remove duplicate or unnecessarily broad keep rules.
8. Avoid keeping entire third-party libraries when their official consumer ProGuard/R8 rules already handle them.
9. Keep useful debugging attributes for release diagnostics without unnecessarily preventing optimization.

Then run:
- Clean build
- Release build with minification/R8 enabled
- Check all R8 warnings
- Check missing classes
- Check Room database initialization
- Check Moshi serialization/deserialization
- Check Retrofit API interfaces
- Check Developer Panel
- Check Secure API layer
- Check APK/AAB generation

If R8 reports a missing class, investigate the actual dependency and add the smallest appropriate rule rather than using a broad keep rule.

Final report:
- ProGuard/R8 optimization: PASS/FAIL
- Release build: PASS/FAIL
- Compilation errors: count
- R8 warnings: count
- Missing classes: count
- Rules added: list
- Rules removed/optimized: list
- APK/AAB generated: YES/NO
- Existing functionality preserved: YES/NOAdd project specific ProGuard rules here.

# Preserve Line Numbers for Debugging
-keepattributes SourceFile,LineNumberTable,*Annotation*,InnerClasses,EnclosingMethod
-renamesourcefileattribute SourceFile

# --- Room Database Keep Rules ---
-keep class * extends androidx.room.RoomDatabase
-dontwarn androidx.room.paging.**
-keep @androidx.room.Entity class * { *; }
-keepclassmembers class * {
    @androidx.room.Dao *;
}

# --- Jetpack Compose Keep Rules ---
-keepclassmembers class * extends androidx.compose.ui.node.LayoutNode { *; }
-dontwarn androidx.compose.**

# --- Data Entities, Repository & API Models ---
-keep class com.example.data.** { *; }
-keepclassmembers class com.example.data.** { *; }

# --- Security & Keystore Utilities ---
-keep class com.example.data.api.security.** { *; }
-keep class com.example.util.SecurityUtils { *; }

# --- Moshi & Retrofit Keep Rules ---
-keep class com.squareup.moshi.** { *; }
-keepclassmembers class * {
    @com.squareup.moshi.Json *;
}
-dontwarn retrofit2.**
-keep class retrofit2.** { *; }
-keepclassmembers class * {
    @retrofit2.http.** *;
}


