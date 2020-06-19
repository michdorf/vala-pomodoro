public class Pomodoro.ListaTodo : Gtk.ListBox {
    private Pomodoro.Todo[] todos;
    
    public ListaTodo(Pomodoro.Todo[] todos = {}) {
    	if (todos.length > 0) {
    		set_todos(todos);
    	}
    }
    
    public void set_todos(Pomodoro.Todo[] todos) {
    	this.todos = todos;
    	list_todos();
    }
    
    private void list_todos() {
        Gtk.Label todoLabel;
        foreach (Todo todo in this.todos) {
            todoLabel = new Gtk.Label(todo.testo);
            todoLabel.halign = Gtk.Align.START;
        	add(todoLabel);
        }
    }
}
