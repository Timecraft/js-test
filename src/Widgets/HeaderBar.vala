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

public class JSTest.HeaderBar : Gtk.HeaderBar {
    static HeaderBar? instance;

    HeaderBar () {

    }
    construct {
        if (does_schema_exist ("io.elementary.code.settings")) {
            GLib.Settings code_settings = new GLib.Settings ("io.elementary.code.settings");
            if (code_settings.get_boolean ("prefer-dark-style")){
                Utils.set_theming_for_screen (this.get_screen (), "@define-color textColorPrimary rgba (0,0,0,1);", Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
            }//endif (prefers dark style)
        }//endif (does_schema_exist)
        
        Utils.set_color_primary (this, Constants.APPLICATION_BRAND);
        set_show_close_button (true);
        set_title (_("JS Test"));

        Gtk.Button run_button = new Gtk.Button.from_icon_name ("media-playback-start-symbolic",Gtk.IconSize.LARGE_TOOLBAR);
        run_button.tooltip_markup = Granite.markup_accel_tooltip ({"<Ctrl>R"}, _("Run Script"));
        pack_end (run_button);
        
        CopyButton copy_button = CopyButton.get_instance ();
        pack_end (copy_button);
        
        run_button.clicked.connect (() => {
            
            WebView web_view = WebView.get_instance ();
            web_view.run_code ();
//            JSConsole.get_instance ().get_buffer ().text = "";
        });//end run_button.clicked.connect
    }
    
    public static HeaderBar get_instance () {
       if (instance == null) {
           instance = new HeaderBar ();
       }
       return instance;
    }


}
