package com.ecsedu.app

import io.flutter.embedding.android.FlutterActivity

// Added these three import lines
import android.view.WindowManager; 
import android.view.WindowManager.LayoutParams;
import android.os.Bundle;

class MainActivity: FlutterActivity(){
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Added this line
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE);
    }
}

