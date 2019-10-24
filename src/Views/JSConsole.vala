public class JSTest.JSConsole : Gtk.TextView {
    static JSConsole? instance;
    
    
    
    public JSConsole () {
        set_size_request (Constants.APPLICATION_HEIGHT / 4, Constants.APPLICATION_WIDTH / 3);
        editable = false;
        can_focus = false;
        set_buffer (buffer);
    }
    
    public void set_text (string new_text) {
        buffer.set_text (new_text);
    }
    
    public static JSConsole get_instance () {
        if (instance == null) {
            instance = new JSConsole ();
        }
        return instance;
    }
}
