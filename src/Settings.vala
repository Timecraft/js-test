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

namespace JSTest {
    public bool does_schema_exist (string path, string id) {
        try {
            SettingsSchemaSource source = new SettingsSchemaSource.from_directory (path, null, false);
            SettingsSchema schema = source.lookup (id,false);
            if (schema == null) {
                warning ("Could not find GSettings ID: %s", id);
                return false;
            }
            else {
                message ("Found GSettings ID: %s", id);
                return true;
            }
        }
        catch (Error e) {
            warning ("Could not find GSettings ID: %s", e.message);
        }
        return false;
    }
}
