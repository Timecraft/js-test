public class JSTest.Application : Gtk.Application {
    public static GLib.Settings settings;

    public Application () {
        Object (
            application_id: "com.github.timecraft.jstest",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    static construct {
        //settings = new Settings (Application.instance.application_id);
        
    }

    protected override void activate () {
        JSTest.MainWindow main_window = new JSTest.MainWindow (this);
        shutdown.connect ( () => {
            File destroyer =  File.new_for_path ("jstest.js");
            destroyer.delete_async (Priority.DEFAULT, null);
            message ("\"jstest.js\" has been deleted");
        });
        main_window.show_all ();
    }
    
    
    

    public static int main (string[] args) {
        var app = new Application ();
        return app.run (args);
    }
}
