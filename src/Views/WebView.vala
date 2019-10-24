public class JSTest.WebView : WebKit.WebView {

    static WebView? instance;

    FileManager file_manager = FileManager.get_instance ();



    public WebView () {

    }
    construct {
        WebKit.Settings web_settings = new WebKit.Settings ();
        web_settings.set_enable_javascript (true);

                            //2/3 APPLICATION HEIGHT
        set_size_request (2 * Constants.APPLICATION_HEIGHT / 3, Constants.APPLICATION_WIDTH / 3);


    }


    public static WebView get_instance () {
        if (instance == null) {
            instance = new WebView ();
        }
        return instance;
    }
    public void run_code () {
        load_html ("<script>" + file_manager.read_file () + "</script>", null);
        run_code_for_console ();
    }
    /*
    private async void run_code_for_console () {
        try {
            var result = yield run_javascript(file_manager.get_code_test_file_as_string (), null);
            JSConsole.get_instance ().set_text ((string) result);
        }
        catch (Error e) {
            error ("%s",e.message);
        }
    }
    */

    // TODO: Figure out how to capture Javascript console output or implement a Javascript console
    private void run_code_for_console () {
        message ("STUB: run_code_for_console ()\t---\tThis function is not yet implemented");
    }
}
