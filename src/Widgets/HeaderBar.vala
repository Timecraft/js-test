using Granite.Widgets;

public class JSTest.HeaderBar : Gtk.HeaderBar {
    static HeaderBar? instance;
    
    HeaderBar () {
        
    }
    construct {
        GLib.Settings code_settings = new GLib.Settings ("io.elementary.code.settings");
        if (code_settings.get_boolean ("prefer-dark-style")){
            Utils.set_theming_for_screen (this.get_screen (), "@define-color textColorPrimary rgba (0,0,0,1);", Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
        }
        Utils.set_color_primary (this, Constants.APPLICATION_BRAND);
        set_show_close_button (true);
        set_title (_("JS Test"));
        
        Gtk.Button run_button = new Gtk.Button.from_icon_name ("media-playback-start-symbolic",Gtk.IconSize.LARGE_TOOLBAR);
        run_button.tooltip_text = "Run script";
        pack_end (run_button);
        run_button.clicked.connect (() => {
            message ("Running script...");
            WebView web_view = WebView.get_instance ();
            web_view.run_code ();
            JSConsole.get_instance ().get_buffer ().text = "";
        });
    }
    public static HeaderBar get_instance () {
       if (instance == null) {
           instance = new HeaderBar ();
       }
       return instance;
    }
    

}
