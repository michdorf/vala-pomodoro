/*
* Copyright (c) 2020 - Michele Dorph
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
* Authored by: Michele Dorph <michele@dorph.dk>
*/

public class Application: Gtk.Application {
    /* Samme navn som classen. 
    * Både Application og construct bliver kaldt,
    * men Application bliver kun kaldt ved første kald
    * construct() bliver kaldt hver gang
    */
    public Application() { 
        Object(
            application_id: "com.github.michdorf.vala-pomodoro",
            flags: /*GLib.*/ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var window = new Pomodoro.Window (this);

        var loginWindow = new Pomodoro.LoginWindow(window);

        add_window(window);
    }
}

