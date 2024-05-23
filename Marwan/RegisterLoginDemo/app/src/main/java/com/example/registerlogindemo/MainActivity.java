package com.example.registerlogindemo;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    private EditText etEmail, etPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        etEmail = findViewById(R.id.etEmail);
        etPassword = findViewById(R.id.etPassword);
    }
    public void login(View view) {
        String email = etEmail.getText().toString().trim();
        String password = etPassword.getText().toString().trim();

        if (!email.isEmpty() && !password.isEmpty()) {
// Récupérer les informations d'inscription
            SharedPreferences sharedPreferences = getSharedPreferences("MyPrefs", MODE_PRIVATE);
            String storedEmail = sharedPreferences.getString("email", "");
            String storedPassword = sharedPreferences.getString("password", "");

// Vérifier les informations de connexion
            if (email.equals(storedEmail) && password.equals(storedPassword)) {
// Authentification réussie, rediriger vers Success
                Intent intent = new Intent(MainActivity.this, AccueilActivity.class);
                startActivity(intent);
            } else {
// Informer l'utilisateur que les informations de connexion sont incorrectes
                Toast.makeText(this, "Email ou Mot de Passe incorrect", Toast.LENGTH_SHORT).show();
            }
        } else {
// Informer l'utilisateur que tous les champs doivent être remplis
            Toast.makeText(this, "Veillez remplir tous les champs", Toast.LENGTH_SHORT).show();
        }
    }
    public void register(View view) {
        Intent intent = new Intent(this, Register.class);
        startActivity(intent);
    }
}