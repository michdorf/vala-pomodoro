public class Pomodoro.ListaTodo : Gtk.Grid {
    private Pomodoro.Todo[] todos;
    private Gtk.Box cont;
    private Gtk.ListBox lista;
    
    public ListaTodo(Pomodoro.Todo[] todos = {}) {
        this.lista = new Gtk.ListBox();
        this.lista.hexpand = true;
        this.lista.activate_on_single_click = true;
        this.lista.row_activated.connect((row) => {
            stdout.printf("Du valgte: %s\n", ((Gtk.Label)row.get_child()).get_text());
        });

        attach(this.lista, 0, 0, 2, 1);
        
        /// Il buttone mostrato vicino al input
        var agg_entry = new Gtk.Entry();
        agg_entry.hexpand = true;
        attach(agg_entry, 0, 1, 1, 1);
        var agg_button = new Gtk.Button.with_label(_("Aggiungi"));
        attach(agg_button, 1, 1, 1, 1);
        agg_button.clicked.connect(() => { 
            aggiungi(agg_entry.get_text()); 
        });

    	if (todos.length > 0) {
    		set_todos(todos);
        }
    }

    public Gtk.Box get_cont() {
        return this.cont;
    }

    private void aggiungi(string todo) {
        this.todos += new Pomodoro.Todo(todo);
        list_todos();
    }
    
    public void set_todos(Pomodoro.Todo[] todos) {
    	this.todos = todos;
    	list_todos();
    }
    
    private void list_todos() {
        Gtk.Label todoLabel;
        Gtk.ListBoxRow riga;
        Todo todo;
        for (var i = 0; i < this.todos.length; i++) {
            todo = this.todos[i];
            riga = this.lista.get_row_at_index(i);
            if (riga != null) {
                ((Gtk.Label)riga.get_child()).set_text(todo.testo);
            } else {
                todoLabel = new Gtk.Label(todo.testo);
                todoLabel.halign = Gtk.Align.START;
                this.lista.add(todoLabel);
                todoLabel.show(); // Åbenbart nødvendig
            }
        }
    }
}
