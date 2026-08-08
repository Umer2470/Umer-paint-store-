# Add project specific ProGuard rules here.

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


