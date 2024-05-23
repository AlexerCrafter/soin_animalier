package com.example.registerlogindemo;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.preference.PreferenceManager;

public class SettingsPage extends AppCompatActivity {

    // Ajoutez une variable pour représenter l'état du mode sombre
    private boolean isDarkModeEnabled;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings_page);

// Trouvez l'image de la flèche "Taille du texte"
        @SuppressLint({"MissingInflatedId", "LocalSuppress"}) ImageView textSizeArrow = findViewById(R.id.backButton); // Utilisez le bon ID correspondant à l'image dans votre XML

// Ajoutez un écouteur d'événements à l'image de la flèche "Taille du texte"
        textSizeArrow.setOnClickListener(view -> {
// Créez une intention pour ouvrir TailleActivity.java
            Intent intent = new Intent(SettingsPage.this, AccueilActivity.class);
// Lancez l'activité TailleActivity
            startActivity(intent);
        });

// Initialiser les vues et ajouter des écouteurs d'événements comme précédemment

// Ajouter un écouteur d'événements pour le bouton de mode sombre
        ImageView nightModeIcon = findViewById(R.id.nightModeIcon);
        nightModeIcon.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
// Inverser l'état du mode sombre
                isDarkModeEnabled = !isDarkModeEnabled;

// Enregistrer l'état du mode sombre dans les préférences partagées
                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(SettingsPage.this);
                SharedPreferences.Editor editor = preferences.edit();
                editor.putBoolean("dark_mode_enabled", isDarkModeEnabled);
                editor.apply();

// Appliquer le thème sombre
                applyDarkMode();
            }
        });

// Vérifier l'état actuel du mode sombre
        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(this);
        isDarkModeEnabled = preferences.getBoolean("dark_mode_enabled", false);
// Appliquer le thème sombre si nécessaire
        if (isDarkModeEnabled) {
            applyDarkMode();
        }



// Ecouteur d'événements pour ouvrir LangueActivity
        findViewById(R.id.langue_acess).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
// Ouvrir LangueActivity
                Intent intent = new Intent(SettingsPage.this, LangueActivity.class);
                intent.putExtra("dark_mode_enabled", isDarkModeEnabled);
                startActivity(intent);
            }
        });

// Ecouteur d'événements pour ouvrir SecurityPrivacyActivity
        findViewById(R.id.security).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
// Ouvrir SecurityPrivacyActivity
                Intent intent = new Intent(SettingsPage.this, SecurityPrivacyActivity.class);
                intent.putExtra("dark_mode_enabled", isDarkModeEnabled);
                startActivity(intent);
            }
        });

// Ecouteur d'événements pour arrêter l'application
        ImageView quitAppIcon = findViewById(R.id.quitAppIcon);
        quitAppIcon.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
// Arrêter complètement l'application
                finishAffinity();
            }
        });

// Trouvez l'icône de notification
        ImageView notificationIcon = findViewById(R.id.notificationIcon);

// Ajoutez un écouteur d'événements à l'icône de notification
        notificationIcon.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
// Mettez votre code pour activer la notification ici
// Par exemple, ouvrez une nouvelle activité ou déclenchez une action pour afficher la notification
// Vous pouvez également ajouter du code pour vérifier l'état du mode sombre si nécessaire
            }
        });
    }

    // Méthode pour appliquer le thème sombre
    private void applyDarkMode() {
        if (isDarkModeEnabled) {
// Activer le thème sombre
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_YES);
        } else {
// Désactiver le thème sombre
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO);
        }
    }

// Vous pouvez ajouter d'autres méthodes ou écouteurs d'événements ici selon vos besoins

}



