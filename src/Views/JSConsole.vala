public class JSTest.JSConsole : Gtk.TextView {
    static JSConsole? instance;
    static JSC.Context context;
    JSC.Value result;

    public JSConsole () {
        set_size_request (Constants.APPLICATION_HEIGHT / 4, Constants.APPLICATION_WIDTH / 3);
        editable = false;
        can_focus = false;
        set_buffer (buffer);
    }
    construct {
        context = new JSC.Context ();
    }

    public void set_text (string new_text) {
        buffer.set_text (new_text);
    }

    public void run_code_for_console () {
        result = context.evaluate_with_source_uri ("", -1, "jstest.js", 0);
        //result = new JSC.Value.undefined (context);
        // Redundancy never hurts
        
        set_text ((string) result);

    }

    public static JSConsole get_instance () {
        if (instance == null) {
            instance = new JSConsole ();
        }
        return instance;
    }
}
