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

public class JSTest.CopyButton : Gtk.Button {

    public static CopyButton? instance;
    
    private Gtk.Clipboard clipboard = Gtk.Clipboard.get (Gdk.SELECTION_CLIPBOARD);
    private SourceView source_view = SourceView.get_instance ();
   // private Gtk.AccelGroup accel_group = new Gtk.AccelGroup ();
    private Toast copy_success = new Toast (_("Script copied to clipboard"));
    private Overlay overlay = Overlay.get_instance ();
    
    public CopyButton () {
        Object (
            image: new Gtk.Image.from_icon_name ("edit-copy-symbolic", Gtk.IconSize.LARGE_TOOLBAR)
        );
    }
    construct {
        
        tooltip_markup = Granite.markup_accel_tooltip ({"<Ctrl>I"}, _("Copy Script"));
        overlay.add_overlay (copy_success);
        
        clicked.connect ( () => {
            copy ();
        });
    }
    
    public void click () {
        copy ();
    }
    private static void copy () {
        instance.clipboard.set_text (instance.source_view.buffer.text, -1);
        instance.copy_success.send_notification ();
    }
    
    public static CopyButton get_instance () {
        if (instance == null) {
            instance = new CopyButton ();
        }
        return instance;
    }
}
