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


public class JSTest.Toast : Granite.Widgets.Toast {
    public static Toast? instance;
    
    public Toast (string title) {
        Object (
            title: title
        );
    }
    construct {
        show_all ();
    }//endconstruct

    
    
    // Does not have title; default instance getter
    public Toast get_instance () {
        if (instance == null) {
            instance = new Toast ("");
        }
        return instance;
    }
    
    // Has title; default setter
    public Toast set_instance (string title) {
        if (instance == null) {
            instance = new Toast (title);
        }
        else {
            instance.title = title;
        }
        return instance;
    }
}
