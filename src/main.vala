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
    public static GLib.Settings settings;

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
    }

    protected override void activate () {
        JSTest.MainWindow main_window = new JSTest.MainWindow (this);
        shutdown.connect ( () => {
            File destroyer =  File.new_for_path ("jstest.js");
            destroyer.delete_async.begin (Priority.DEFAULT, null);
            message ("\"jstest.js\" has been deleted");
        });
        main_window.show_all ();
    }




    public static int main (string[] args) {
        var app = new Application ();
        return app.run (args);
    }
}
