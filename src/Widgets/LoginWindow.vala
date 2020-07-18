class Pomodoro.LoginWindow : Gtk.Window {
    construct {
        type = Gtk.WindowType.TOPLEVEL;
        decorated = false;
        modal = false;
    }

    public LoginWindow(Gtk.Window parent) {
        /* var d = new Gtk.Dialog.with_buttons (
			_("Login"),
			parent,
			Gtk.DialogFlags.MODAL | Gtk.DialogFlags.DESTROY_WITH_PARENT,
			"Custom Button", 1, null
		);*/
        title = "Login";
        set_transient_for(parent);
        window_position = Gtk.WindowPosition.CENTER_ON_PARENT;
        set_default_size(350, 80);

        /* Position like macOs style dialog inside window */
        int x, y, nn;
        parent.get_position(out nn, out y);
        get_position(out x, out nn);
        Gtk.Allocation allocation;
        var headerbar = parent.get_titlebar();
        headerbar.get_allocation(out allocation);
        move(x, y + allocation.height);

        layout();

        show_all();
        //  d.show_all();
        //  d.present();
    }

    void layout() {
        var cont = new Gtk.Grid();
        var titolo = new Gtk.Label(_("Login"));
        cont.attach(titolo,0,0,2);
        titolo.get_style_context().add_class("h1");

        cont.attach(new Gtk.Label("Brugernavn: "), 0, 1);
        
        var nomeuEntry = new Gtk.Entry();
        nomeuEntry.hexpand = true;
        cont.attach(nomeuEntry, 1, 1);

        var codiceEntry = new Gtk.Entry();
        codiceEntry.set_visibility(false);
        codiceEntry.hexpand = true;
        cont.attach(new Gtk.Label("Kode: "), 0, 2);
        cont.attach(codiceEntry, 1, 2);

        var submit = new Gtk.Button.with_label("Login");
        submit.get_style_context().add_class("suggested-action");
        submit.clicked.connect(() => {
            stdout.printf(_("Du har logget ind som %s med koden %s\n"), nomeuEntry.text, codiceEntry.text);

            this.close();
        });
        submit.hexpand = true;
        cont.attach(submit, 0, 3, 2);

        add(cont);
    }
}