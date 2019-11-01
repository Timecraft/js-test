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
                case (Gdk.Key.r):
                    if ((key.state & Gdk.ModifierType.CONTROL_MASK) != 0) {
                        WebView web_view = WebView.get_instance ();
                        web_view.run_code ();
                    }
                    break;
                case (Gdk.Key.i):
                    if ((key.state & Gdk.ModifierType.CONTROL_MASK) != 0) {
                        CopyButton.get_instance ().click ();
                    } 
                    break;
            }
        return false;
    });
    }
}
