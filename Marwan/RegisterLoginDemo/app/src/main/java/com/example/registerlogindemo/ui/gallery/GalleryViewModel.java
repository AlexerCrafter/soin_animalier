package com.example.registerlogindemo.ui.gallery;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

public class GalleryViewModel extends ViewModel {

    private final MutableLiveData<String> mText;

    public GalleryViewModel() {
        mText = new MutableLiveData<>();
        mText.setValue("Français : Nos animaux sont importants, des millions d'animaux sont abandonnées chaque année dans le monde entier.\n\n Espagnol : Nuestros animales son importantes, millones de animales son abandonados cada año en todo el mundo.\n\n Anglais : Our animals are important, millions of animals are abandoned every year around the world.\n\n Japonais : 私たちの動物は大切であり、世界中で毎年何百万もの動物が捨てられています。");
    }

    public LiveData<String> getText() {
        return mText;
    }
}
