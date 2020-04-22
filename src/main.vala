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


public class JSTest.Application : Gtk.Application {
    private SettingsManager settings;
    
    public Gtk.CssProvider css_provider;

    //  = new Settings (Constants.APPLICATION_NAME);

    public Application () {
        Object (
            application_id: "com.github.timecraft.jstest",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    static construct {
        //settings = new Settings (Application.instance.application_id);
                            // e.g. 2.8.1
        string version =    WebKit.get_major_version ().to_string () + "." +
                            WebKit.get_minor_version ().to_string () + "." +
                            WebKit.get_micro_version ().to_string ();
        message ("Using WebKit " + version);


    }//endconstruct

    protected override void activate () {
        settings = new SettingsManager (Constants.APPLICATION_NAME);
        // SettingsManager.make_instance (Constants.APPLICATION_NAME);
        JSTest.MainWindow main_window = new JSTest.MainWindow (this);
        
        
        css_provider = new Gtk.CssProvider ();
        css_provider.load_from_resource ("com/github/timecraft/jstest/Application.css");
        Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
        
        
        shutdown.connect ( () => {
            File destroyer =  File.new_for_path ("jstest.js");
            destroyer.delete_async.begin (Priority.DEFAULT, null);
            message ("\"jstest.js\" has been deleted");
            settings.save_variables ();
        }); //end shutdown.connect

        
        
        if (settings != null) {
            
            go_to_last_saved_position (main_window);
            go_to_last_saved_size (main_window);
        }//endif (does_schema_exist)
        main_window.show_all ();
    }//end activate

        private void go_to_last_saved_position (MainWindow main_window) {
            int window_x, window_y;
            settings.get ("window-position", "(ii)", out window_x, out window_y);
            if (window_x != -1 || window_y != -1) {
                main_window.move (window_x, window_y);
            }//endif (window_x != -1,etc)
        }

        private void go_to_last_saved_size (MainWindow main_window) {
            var rect = Gtk.Allocation ();

            settings.get ("window-size", "(ii)", out rect.width, out rect.height);
            main_window.set_allocation (rect);

            if (settings.window_maximized) {
                main_window.maximize ();
            }//endif (app_settings.get_boolean)
        }


    public static int main (string[] args) {
        var app = new Application ();
        return app.run (args);
    }//endmain
}
