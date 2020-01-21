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


public class JSTest.SettingsManager : Settings {
        
        // Settings that are "completely unique" to JS Test
        public bool window_maximized;
        // No clue what to put "(ii)" as
        // public donthaveaclue window-position;
        // public donthaveaclue window-size;
        
        // Settings that originate from elementary Code
        public bool auto_indent;
        public bool spaces_instead_of_tabs;
        public bool show_right_margin;
        
        
        public int indent_width;
        public int right_margin_position;
        
        public string font;
        public string style_scheme;
        
        private Gtk.Settings gtk_settings = Gtk.Settings.get_default ();
        
        public static SettingsManager? instance = null;


        public SettingsManager (string id) {
                    if (does_schema_exist (id)) {
                        Object (
                            schema_id: id
                        );
                        
                        gtk_settings.gtk_application_prefer_dark_theme = this.get_boolean ("prefer-dark-style");
                        
                        // Get booleans from schema
                        window_maximized = this.get_boolean ("window-maximized");
                        auto_indent = this.get_boolean ("auto-indent");
                        spaces_instead_of_tabs = this.get_boolean ("spaces-instead-of-tabs");
                        show_right_margin = this.get_boolean ("show-right-margin");
                        
                        // Get integers from schema
                        indent_width = this.get_int ("indent-width");
                        right_margin_position = this.get_int ("right-margin-position");
                        
                        // Get strings from schema
                        font = this.get_string ("font");
                        style_scheme = this.get_string ("style-scheme");
                    }//endif (does_schema_exist)
                    instance = this;
                    
        }

        
        public void save_variables () {
            if (this != null) {
                // Save booleans
                this.set_boolean ("window-maximized", window_maximized);
                this.set_boolean ("auto-indent", auto_indent);
                this.set_boolean ("spaces-instead-of-tabs", spaces_instead_of_tabs);
                this.set_boolean ("show-right-margin", show_right_margin);
                
                // Save integers
                this.set_int ("indent-width", indent_width);
                this.set_int ("right-margin-position", right_margin_position);
                
                // Save strings
                this.set_string ("font", font);
                this.set_string ("style-scheme", style_scheme);
            }
        }

        
    public static bool does_schema_exist (string id) {
        SettingsSchemaSource source = SettingsSchemaSource.get_default ();
        SettingsSchema schema = source.lookup (id,false);
        if (schema == null) {
            warning ("Could not find GSettings ID: %s. Continuing with no schema", id);
            return false;
        }//endif (schema == null)
        else {
            message ("Found GSettings ID: %s", id);
            return true;
        }//endelse
    }
}//endclass
