/* application.vala
 *
 * Copyright 2022 Jamie Murphy
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace PeterAlert {
    public class Application : Adw.Application {
        public Application () {
            Object (application_id: "dev.itsjamie9494.PeterAlert", flags: ApplicationFlags.FLAGS_NONE);
        }

        construct {
            Intl.setlocale (LocaleCategory.ALL, "");
            Intl.textdomain (Config.GETTEXT_PACKAGE);
            Intl.bindtextdomain (Config.GETTEXT_PACKAGE, Config.LOCALEDIR);
            Intl.bind_textdomain_codeset (Config.GETTEXT_PACKAGE, "UTF-8");
        
            ActionEntry[] action_entries = {
                { "about", this.on_about_action },
                { "quit", this.quit }
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("app.quit", {"<primary>q"});
            this.set_accels_for_action ("app.about", {"<shift><ctrl>a"});
        }

        public override void activate () {
            base.activate ();
            var win = this.active_window;
            if (win == null) {
                win = new PeterAlert.Window (this);
            }
            win.present ();
        }

        private void on_about_action () {
            string[] authors = { "Jamie Murphy" };
            Gtk.show_about_dialog (this.active_window,
                                   "program-name", "Peter Alert",
                                   "authors", authors,
                                   "comments", _("A GTK4 recreation of the peter alert joke"),
                                   "copyright", _("Copyright © 2022 Jamie Murphy"),
                                   "logo-icon-name", "dev.itsjamie9494.PeterAlert",
                                   "website", "https://jamiethalacker.dev",
                                   "website-label", _("My Personal Website"),
                                   "license-type", Gtk.License.GPL_3_0,
                                   "version", Config.VERSION);
        }
    }
}

int main (string[] args) {
    var app = new PeterAlert.Application ();
    return app.run (args);
}
