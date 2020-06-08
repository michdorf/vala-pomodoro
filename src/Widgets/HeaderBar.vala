public class Todo.HeaderBar: Gtk.HeaderBar {

	public Todo.Window main_window { get; construct; }
	
	public HeaderBar(Todo.Window window) {
		Object(
			main_window: window
		);
	}

	construct {
		// title = "Micheles Todo app";
		// subtitle = "Posso aiutarti?";
		
		set_show_close_button(true);
		
		var add_button = new Gtk.Button.with_label("Aggiungi"); // Translatable
		add_button.get_style_context().add_class("suggested-action");
		add_button.valign = Gtk.Align.CENTER;
		
		add_button.clicked.connect (() => {
			open_dialog();
		});
		
		pack_start(add_button);

		var stack_switcher = new Gtk.StackSwitcher();
		
		stack_switcher.stack = main_window.stack;
		
		set_custom_title(stack_switcher);

		var menu_button = new Gtk.Button.from_icon_name("open-menu", Gtk.IconSize.LARGE_TOOLBAR);
		menu_button.valign = Gtk.Align.CENTER;
		
		pack_end(menu_button);
	}
	
	public void open_dialog() {
		var dialog = new Gtk.Dialog.with_buttons (
			"Aggiungi un compito",
			main_window,
			Gtk.DialogFlags.MODAL | Gtk.DialogFlags.DESTROY_WITH_PARENT,
			"Custom Button", 1,
			"Custom Button 2", 2, null
		);
		
		var label = new Gtk.Label("This is the content of my Dialog");
		var content_area = dialog.get_content_area();
		content_area.add(label);
		
		dialog.show_all();
		dialog.present();
	}
}
