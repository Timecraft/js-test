/*
* Copyright © 2019 Timecraft (https://github.com/timecraft)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Timecraft <timemaster23x@gmail.com>
*/


using Granite.Widgets;

public class JSTest.MainWindow : Gtk.Window {

    private Gtk.Paned pane = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
    private HeaderBar header_bar = HeaderBar.get_instance ();


    private SourceView source_view = SourceView.get_instance ();
    private WebView web_view = WebView.get_instance ();
    private Overlay overlay = Overlay.get_instance ();
    
    private Settings app_settings;
    private uint configure_id;

    private bool schema_exists = false;


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
        overlay.add (pane);
        add (overlay);
        set_titlebar (header_bar);
        add_shortcuts ();
        schema_exists = does_schema_exist (Constants.APPLICATION_NAME);

    }//endconstruct

    private void add_shortcuts () {
        key_press_event.connect ((key) => {

            switch (key.keyval) {
                //Quit
                case (Gdk.Key.q):
                    if ((key.state & Gdk.ModifierType.CONTROL_MASK) != 0) {
                        message ("Quitting.");
                        this.destroy ();
                    }
                    break; //endcase "q"
                case (Gdk.Key.r):
                    if ((key.state & Gdk.ModifierType.CONTROL_MASK) != 0) {
                        WebView web_view = WebView.get_instance ();
                        web_view.run_code ();
                    }
                    break; //endcase "r"
                case (Gdk.Key.i):
                    if ((key.state & Gdk.ModifierType.CONTROL_MASK) != 0) {
                        CopyButton.get_instance ().click ();
                    } //endcase "i"
                    break;
            }
        return false;
        }); //end key_press_event.connect
    }
    
    
    public override bool configure_event (Gdk.EventConfigure event) {
        
        if (schema_exists) {
            app_settings = new Settings (Constants.APPLICATION_NAME);
         
            if (configure_id != 0) {
                GLib.Source.remove (configure_id);
            }//endif (configure_id != 0)

            configure_id = Timeout.add (100, () => {
                configure_id = 0;

                if (is_maximized) {
                    app_settings.set_boolean ("window-maximized", true);
                } //endif (is_maximized)
                else {
                    app_settings.set_boolean ("window-maximized", false);
        
                    Gdk.Rectangle rect;
                    get_allocation (out rect);
                    app_settings.set ("window-size", "(ii)", rect.width, rect.height);
        
                    int root_x, root_y;
                    get_position (out root_x, out root_y);
                    app_settings.set ("window-position", "(ii)", root_x, root_y);
                }//endelse
        
                return false;
            });//end configure_id = Timeout.add (100, etc.)

            return base.configure_event (event);
        }//endif (schema_exists)
        else {
            return false;
        }
    }
}
