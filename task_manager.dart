import 'task.dart';

class TaskManager
 {
  List<Task> tasks = []; // List to hold Task objects.

  void addTask(Task task) 
  {
    tasks.add(task); // Add a new task to the list.
  }

  void updateTask(int index, Task task) 
  {
    // Validate index before updating.
    if (index < 0 || index >= tasks.length) 
    {
      throw RangeError('Index out of range');
    }
    tasks[index] = task; // Update the task at the specified index.
  }

  void deleteTask(int index) 
  {
    // Validate index before deleting.
    if (index < 0 || index >= tasks.length) 
    {
      throw RangeError('Index out of range');
    }
    tasks.removeAt(index); // Remove the task at the specified index.
  }

  List<Task> getTasks() 
  {
    return tasks; // Return the list of all tasks.
  }

  List<Task> getCompletedTasks() 
  {
    return tasks.where((task) => task.isCompleted).toList(); // Return completed tasks.
  }

  List<Task> getIncompleteTasks()
   {
    return tasks.where((task) => !task.isCompleted).toList(); // Return incomplete tasks.
  }

  void toggleTaskCompletion(int index) 
  {
    // Validate index before toggling completion status.
    if (index < 0 || index >= tasks.length)
     {
      throw RangeError('Index out of range');
    }
    tasks[index].isCompleted = !tasks[index].isCompleted; // Toggle completion status.
  }

  List<Task> searchTasks(String searchTerm)
   {
    // Return tasks that match the search term in title or description,arrow function used to filter the list.
    return tasks.where((task) =>
        task.title.toLowerCase().contains(searchTerm.toLowerCase()) 
                                   ||
        task.description.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
  }
}