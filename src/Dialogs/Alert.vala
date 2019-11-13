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

// Not sure this is ever used. We can probably get rid of it.
using Granite;

public class JSTest.Alert : Object {

    public Alert (string title, string description) {
        var message_dialog = new MessageDialog.with_image_from_icon_name (title, description, "dialog-warning");
        message_dialog.window_position = Gtk.WindowPosition.CENTER_ON_PARENT;
        message_dialog.show_all ();

        if (message_dialog.run () == Gtk.ResponseType.CLOSE) {
            message_dialog.destroy ();
        }//endif (message_diaglog.run, etc.)
    }
}
