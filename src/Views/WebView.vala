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
