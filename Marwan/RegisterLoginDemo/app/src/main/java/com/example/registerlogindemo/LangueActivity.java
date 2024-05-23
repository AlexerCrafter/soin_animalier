package com.example.registerlogindemo;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.Spinner;

import androidx.appcompat.app.AppCompatActivity;

import java.util.Locale;

public class LangueActivity extends AppCompatActivity implements AdapterView.OnItemSelectedListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_langue);

        Spinner spinner = findViewById(R.id.spinner);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this, R.array.languages_array, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);
        spinner.setOnItemSelectedListener(this);

        // Ajouter un écouteur d'événements au bouton de retour
        @SuppressLint({"MissingInflatedId", "LocalSuppress"}) ImageView backButton = findViewById(R.id.backButton);
        backButton.setOnClickListener(v -> {
// Rediriger vers l'activité SettingsPage
            Intent intent = new Intent(LangueActivity.this, SettingsPage.class);
            startActivity(intent);
        });

    }

    @SuppressLint("UnsafeIntentLaunch")
    @Override
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        String selectedLang = parent.getItemAtPosition(position).toString();
        if (selectedLang.equals("Français")) {


             }else if (selectedLang.equals("Español")) {
                       setLocal(LangueActivity.this, "es");
                       finish();
                       startActivity(getIntent());
             }else if (selectedLang.equals("English")){
                       setLocal(LangueActivity.this, "an");
                       finish();
                       startActivity(getIntent());

             } else if (selectedLang.equals("日本語")) {
                       setLocal(LangueActivity.this, "ja");
                       finish();
                       startActivity(getIntent());
            } else if (selectedLang.equals("Français")) {
                       setLocal(LangueActivity.this, "fra");
                       finish();
                       startActivity(getIntent());
        }

    }


          @Override
          public void onNothingSelected(AdapterView<?> parent) {
          }

    public void setLocal(Activity activity, String langCode){
        Locale locale = new Locale(langCode);
        locale.setDefault(locale);
        Resources resources = activity.getResources();
        Configuration configuration = resources.getConfiguration();
        configuration.setLocale(locale);
        resources.updateConfiguration(configuration, resources.getDisplayMetrics());

        }

}
