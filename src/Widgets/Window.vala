using Granite.Widgets;

public class JSTest.MainWindow : Gtk.Window {

    private Gtk.Paned pane = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
    private JSTest.HeaderBar header_bar = HeaderBar.get_instance ();


    private JSTest.SourceView source_view = SourceView.get_instance ();
    private JSTest.WebView web_view = WebView.get_instance ();



    public MainWindow (Gtk.Application application) {
            Object (application: application,
                    icon_name: Constants.APPLICATION_NAME,
                    resizable: true,
                    height_request: Constants.APPLICATION_HEIGHT,
                    width_request: Constants.APPLICATION_WIDTH);
        }
    construct {
        //web_pane.set_size_request (Constants.APPLICATION_HEIGHT / 2, Constants.APPLICATION_WIDTH / 3);
        //web_pane.add1 (web_view);


        pane.add1 (source_view);
        pane.add2 (web_view);
        add (pane);
        set_titlebar (header_bar);
        add_shortcuts ();

    }

    private void add_shortcuts () {
        key_press_event.connect ((key) => {

            switch (key.keyval) {
                //Quit
                case (Gdk.Key.q):
                    if ((key.state & Gdk.ModifierType.CONTROL_MASK) != 0) {
                        message ("Quitting.");
                        this.destroy ();
                    }
                break;
            }
        return false;
    });
    }
}
