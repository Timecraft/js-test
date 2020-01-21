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


public class JSTest.SettingsMenu : Gtk.Popover {
    public static SettingsMenu? instance;

    private SettingsManager? settings = SettingsManager.instance;

    public Gtk.RadioButton color_button_dark;
    public Gtk.RadioButton color_button_light;
    public Gtk.RadioButton color_button_white;
    public Gtk.FontButton font_button;

    public Gtk.Grid popover_grid;

    public SettingsMenu () {
    }
    construct {
        SourceView.get_instance ();
        WebView.get_instance ();



        // Create the white (white) radio button
        color_button_white = new Gtk.RadioButton (null);
        color_button_white.halign = Gtk.Align.CENTER;
        color_button_white.tooltip_text = _("white");
        color_button_white.get_style_context ().add_class ("color-button");
        color_button_white.get_style_context ().add_class ("color-white");

        // Create the light (solarized light) radio button
        color_button_light = new Gtk.RadioButton.from_widget (color_button_white);
        color_button_light.halign = Gtk.Align.CENTER;
        color_button_light.tooltip_text = _("Solarized Light");
        color_button_light.get_style_context ().add_class ("color-button");
        color_button_light.get_style_context ().add_class ("color-light");

        // Create the dark (solarized dark) radio button
        color_button_dark = new Gtk.RadioButton.from_widget (color_button_white);
        color_button_dark.halign = Gtk.Align.CENTER;
        color_button_dark.tooltip_text = _("Solarized Dark");
        color_button_dark.get_style_context ().add_class ("color-button");
        color_button_dark.get_style_context ().add_class ("color-dark");


        // Separator
        Gtk.Separator separator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);
        separator.margin_top = 12;

        // FontButton
        Gtk.Label font_label = new Gtk.Label (_("Custom Font"));
        font_button = new Gtk.FontButton.with_font (settings.font);
        font_button.margin_start = 12;

        // Popover menu
        popover_grid = new Gtk.Grid ();
        popover_grid.margin = 10;
        popover_grid.orientation = Gtk.Orientation.VERTICAL;
        popover_grid.width_request = 200;

        popover_grid.attach (color_button_white, 0, 0, 1, 1);
        popover_grid.attach (color_button_light, 1, 0, 1, 1);
        popover_grid.attach (color_button_dark,  2, 0, 1, 1);
        popover_grid.attach (separator, 0, 2, 3, 1);

        popover_grid.attach (font_label, 0, 3, 1, 1);
        popover_grid.attach (font_button, 1, 3, 2, 1);

        add (popover_grid);

        add_signals ();
        check_button ();

        popover_grid.show_all ();
    }

    private void check_button () {
        switch (settings.style_scheme) {
            case "high-contrast":
                color_button_white.active = true;
                break;

            case "solarized-light":
                color_button_light.active = true;
                break;

            case "solarized-dark":
                color_button_dark.active = true;
                break;
        }
    }

    private void add_signals () {
            // White coloring
            color_button_white.clicked.connect ( () => {
                settings.style_scheme = "high-contrast";
                settings.prefer_dark_theme = false;
                SourceView.instance.update_style ();
    
                // Update view styles
                if (SourceView.instance != null) {
                    SourceView.instance.update_style ();
                }
                else {
                    error ("SourceView is null!");
                }
            });
    
            // Solarized light coloring
            color_button_light.clicked.connect ( () => {
                settings.style_scheme = "solarized-light";
                settings.prefer_dark_theme = false;
    
                // Update view styles
                if (SourceView.instance != null) {
                    SourceView.instance.update_style ();
                }
                else {
                    error ("SourceView is null!");
                }
            });
    
            // Solarized dark coloring
            color_button_dark.clicked.connect ( () => {
                settings.style_scheme = "solarized-dark";
                settings.prefer_dark_theme = true;
                // Do not change the contrast of the HeaderBar
                Granite.Widgets.Utils.set_theming_for_screen (this.get_screen (), "@define-color textColorPrimary rgba (0,0,0,1);", Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

                // Update view styles
                if (SourceView.instance != null) {
                    SourceView.instance.update_style ();
                }
                else {
                    error ("SourceView is null!");
                }
            });
        // End color button signals
        
        font_button.font_set.connect ( () => {
            settings.font = font_button.get_font ();
            SourceView.instance.update_style ();
        });
             
        }
}   
