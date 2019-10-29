public class JSTest.SourceView : Gtk.SourceView {

    // Deals with the syntax highlighting
    Gtk.SourceLanguageManager language_manager;

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
        // Settings managers
        Gtk.Settings gtk_settings = Gtk.Settings.get_default ();
        GLib.Settings code_settings = new GLib.Settings ("io.elementary.code.settings");

         // Inherited from io.elementary.code
             // booleans
        set_auto_indent (code_settings.get_boolean ("auto-indent"));
        set_insert_spaces_instead_of_tabs (code_settings.get_boolean ("spaces-instead-of-tabs"));
        set_show_right_margin (code_settings.get_boolean ("show-right-margin"));
        gtk_settings.gtk_application_prefer_dark_theme = code_settings.get_boolean ("prefer-dark-style");

             // int and uint
        set_indent_width (code_settings.get_int ("indent-width"));
        set_right_margin_position (code_settings.get_uint ("right-margin-position"));

            // strings
        override_font (Pango.FontDescription.from_string (code_settings.get_string ("font")));

            // Create language manager
        language_manager = Gtk.SourceLanguageManager.get_default ();


        Gtk.SourceBuffer source_buffer = new Gtk.SourceBuffer (null);
        set_buffer (source_buffer);
        style_scheme_manager = new Gtk.SourceStyleSchemeManager ();
            // Highlight JavaScript
        source_buffer.set_language (language_manager.guess_language ("jstest.js", null));
        source_buffer.highlight_syntax = true;
            // Background style
        source_buffer.set_style_scheme (style_scheme_manager.get_scheme (code_settings.get_string ("style-scheme")));



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
            });

    }


    public static SourceView get_instance () {
        if (instance == null) {
            instance = new SourceView ();
        }
        return instance;
    }
}
