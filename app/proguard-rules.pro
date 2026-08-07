# Add project specific ProGuard rules here.

# Preserve Line Numbers for Debugging
-keepattributes SourceFile,LineNumberTable
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

# --- Data Entities & Serialization Models ---
-keep class com.example.data.entity.** { *; }
-keepclassmembers class com.example.data.entity.** { *; }

# --- Moshi & Retrofit Keep Rules ---
-keep class com.squareup.moshi.** { *; }
-keepclassmembers class * {
    @com.squareup.moshi.Json *;
}
-dontwarn retrofit2.**
-keep class retrofit2.** { *; }

