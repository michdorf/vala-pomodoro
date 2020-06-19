// Bemærk, at den kører under namespace "MyApp"
public class Pomodoro.Window : Gtk.ApplicationWindow {
    private GLib.Settings settings;
    public Gtk.Stack stack { get; set; }

    public Window(Gtk.Application application) {
        Object (
            application: application
        );
    }

    construct {
        // MyApp.Window extender Gtk.ApplicationWindow
        window_position = Gtk.WindowPosition.CENTER;
        set_default_size(350, 80);

        settings = new GLib.Settings("com.github.michdorf.todo");
        
        move(settings.get_int("pos-x"), settings.get_int("pos-y"));
        resize(settings.get_int("window-width"), settings.get_int("window-height"));
        
        delete_event.connect (e => {
            return this.before_destroy(); // can be intercepted with return true
        });
        
        stack = new Gtk.Stack();
        stack.expand = true;
        
        var outstanding = new Gtk.Grid();
		outstanding.add(new Gtk.Label(_("Outstanding page")));
		var completed = new Gtk.Grid();
		completed.add(new Gtk.Label(_("Completed page")));
		
		stack.add_titled(outstanding, "outstanding", _("Outstanding"));
		stack.add_titled(completed, "completed", _("Completed"));
		
		add(stack);
        
        var headerbar = new Pomodoro.HeaderBar(this);
        set_titlebar(headerbar);

        show_all ();
    }
    
    public bool before_destroy() {
        int width, height, x, y;
        
        get_size(out width, out height);
        get_position(out x, out y);
        
        settings.set_int("pos-x", x);
        settings.set_int("pos-y", y);
        settings.set_int("window-width", width);
        settings.set_int("window-height", height);
        
        return false; // Close the app
    }
}
