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

// This file doesn't do anything right now. 
// I am keeping it in the repo in case I can find 
// a way to have the web inspector just show the console 
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
