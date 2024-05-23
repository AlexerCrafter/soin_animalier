package com.example.registerlogindemo;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.ImageView;

import androidx.appcompat.app.AppCompatActivity;

public class SecurityPrivacyActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_security_privacy);

        @SuppressLint({"MissingInflatedId", "LocalSuppress"}) Button buttonAccept2 = findViewById(R.id.buttonAccept2);
        buttonAccept2.setOnClickListener(v -> {
// Rediriger vers l'activité SettingsPage
            Intent intent = new Intent(SecurityPrivacyActivity.this, SettingsPage.class);
            startActivity(intent);
        });

// Ajouter un écouteur d'événements au bouton de retour
        @SuppressLint({"MissingInflatedId", "LocalSuppress"}) ImageView backButton = findViewById(R.id.backButton);
        backButton.setOnClickListener(v -> {
// Rediriger vers l'activité SettingsPage
            Intent intent = new Intent(SecurityPrivacyActivity.this, SettingsPage.class);
            startActivity(intent);
        });
    }
}
