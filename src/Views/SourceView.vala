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


public class JSTest.SourceView : Gtk.SourceView {

    // Deals with the syntax highlighting
    Gtk.SourceLanguageManager language_manager;
    private SettingsManager? settings = SettingsManager.instance;

    public Gtk.SourceLanguage? language {
            set {
                ((Gtk.SourceBuffer) buffer).language = value;
            }
            get {
                return ((Gtk.SourceBuffer) buffer).language;
            }
        }

    // Deals with styling, primarily
    public Gtk.SourceStyleSchemeManager style_scheme_manager;

    static SourceView? instance;

    public SourceView (){
        Object (
            // Wrap mode
            wrap_mode : Gtk.WrapMode.WORD,

            // booleans

            highlight_current_line : true,
            indent_on_tab : true,
            show_line_numbers : true,
            smart_backspace : true,
            show_line_marks : false,
            smart_home_end: Gtk.SourceSmartHomeEndType.BEFORE,

            // int and uint
            tab_width : 4,
            width_request : (Constants.APPLICATION_WIDTH / 2)


        );
    }
    construct {
                if (settings != null) {
                    set_auto_indent (settings.auto_indent);
                    set_insert_spaces_instead_of_tabs (settings.spaces_instead_of_tabs);
                    set_show_right_margin (settings.show_right_margin);


                         // int and uint
                    set_indent_width (settings.indent_width);
                    set_right_margin_position (settings.right_margin_position);

                            // strings
                //override_font (Pango.FontDescription.from_string (code_settings.get_string ("font")));


                    string[] font = settings.font.split (" ", -1);

                    string font_size = font [font.length - 1] + "pt";
         //           font.remove_index (font.length);
                    string font_name = "";
                    foreach (string current in font) {
                        if (current != font [font.length - 1]) {
                            font_name += current;
                                font_name += " ";

                        }

                    } //endforeach

                        Granite.Widgets.Utils.set_theming_for_screen (this.get_screen (),
                                                                        ".sourceview { font-family:\"" +
                                                                         font_name +
                                                                        "\"; " +
                                                                       "font-size: " +
                                                                        font_size +
                                                                        ";}",
                                                                        Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);


                            // Create language manager
                    language_manager = Gtk.SourceLanguageManager.get_default ();


                    Gtk.SourceBuffer source_buffer = new Gtk.SourceBuffer (null);
                    set_buffer (source_buffer);
                    style_scheme_manager = new Gtk.SourceStyleSchemeManager ();
                        // Highlight JavaScript
                    source_buffer.set_language (language_manager.guess_language ("jstest.js", null));
                    source_buffer.highlight_syntax = true;
                        // Background style

                    source_buffer.set_style_scheme (style_scheme_manager.get_scheme (settings.style_scheme));
            }





        cut_clipboard.connect (() => {
                /* If no text is selected, cut the current line */
                if (!buffer.has_selection) {
                    Gtk.TextIter iter_start;
                    buffer.get_iter_at_offset (out iter_start, buffer.cursor_position);
                    iter_start.backward_chars (iter_start.get_line_offset ());
                    Gtk.TextIter iter_end = iter_start;
                    iter_end.forward_line ();

                    if (!iter_start.equal (iter_end)) {
                        var clipboard = Gtk.Clipboard.get_for_display (get_display (), Gdk.SELECTION_CLIPBOARD);
                        string cut_text = iter_start.get_slice (iter_end);

                        buffer.begin_user_action ();
                        clipboard.set_text (cut_text, -1);
                        buffer.delete_range (iter_start, iter_end);
                        buffer.end_user_action ();
                    }
                }
            }); //end cut_clipboard.connect

    }//endconstruct


    public static SourceView get_instance () {
        if (instance == null) {
            instance = new SourceView ();
        }
        return instance;
    }
}
