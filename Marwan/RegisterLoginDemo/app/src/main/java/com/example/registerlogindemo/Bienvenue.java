package com.example.registerlogindemo;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class Bienvenue extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bienvenue);
        Button MainActivityButton = findViewById(R.id.MainActivity);
        MainActivityButton.setOnClickListener(v -> {
            // Créez une intention pour démarrer l'activité MainActivity
            Intent intent = new Intent(Bienvenue.this, MainActivity.class);
            // Lancez l'activité MainActivity
            startActivity(intent);
        });
    }

    public void MainActivity(View view) {
    }
}