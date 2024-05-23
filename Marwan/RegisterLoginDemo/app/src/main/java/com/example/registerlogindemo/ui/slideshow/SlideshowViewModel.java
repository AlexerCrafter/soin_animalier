package com.example.registerlogindemo.ui.slideshow;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

public class SlideshowViewModel extends ViewModel {

    private final MutableLiveData<String> mText;

    public SlideshowViewModel() {
        mText = new MutableLiveData<>();
        mText.setValue("FranÃ§ais : A propos de nous, si vous voulez nous contecter :\n Mail : zarroukmarwan3@gmail.com | alexis95.2004@gmail.com | albertosoares2003@gmail.com.\n\n Espagnol : Sobre nosotros, si quieres contactar con nosotros: Correo electrÃ³nico: zarroukmarwan3@gmail.com | alexis95.2004@gmail.com | albertosoares2003@gmail.com.\n\n Anglais : About us, if you want to contact us: Email: zarroukmarwan3@gmail.com | alexis95.2004@gmail.com | albertosoares2003@gmail.com.\n\n Japonais : ç§ãŸã¡ã«ã¤ã„ã¦ã€ãŠ å•ã„åˆã‚ã›ã‚’ã”å¸Œæœ› ã®å ´åˆ:  é›»å­ãƒ¡ãƒ¼ãƒ«: zarroukmarwan3@gmail.com | alexis95.2004@gmail.com | albertosoares2003@gmail.com. ");
    }

    public LiveData<String> getText() {
        return mText;
    }
}
