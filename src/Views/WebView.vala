public class JSTest.WebView : WebKit.WebView {

    static WebView? instance;
    //static JSConsole console = JSConsole.get_instance ();
//    static WebKit.ConsoleMessage message;
//    static WebKit.UserContentManager manager = new WebKit.UserContentManager ();
//    private WebKit.JavascriptResult js_result;


    private static WebKit.WebInspector inspector;
    FileManager file_manager = FileManager.get_instance ();



    public WebView () {

    }
    construct {
        WebKit.Settings web_settings = new WebKit.Settings ();
        web_settings.set_enable_javascript (true);
        web_settings.set_enable_developer_extras (true);
        set_size_request (Constants.APPLICATION_HEIGHT, Constants.APPLICATION_WIDTH / 2);
        set_settings (web_settings);

    }


    public static WebView get_instance () {
        if (instance == null) {
            instance = new WebView ();
        }
        inspector = instance.get_inspector ();
        return instance;
    }
    public void run_code () {

        inspector.show ();
        load_html ("<script>" + file_manager.read_file () + "</script>", null);
    }
}
