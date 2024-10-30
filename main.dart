import 'dart:io';
import 'task.dart';
import 'task_manager.dart';

void main() {
  final taskManager = TaskManager();

  while (true) 
  {
    printMenu();
    int choice = getUserChoice();

    switch (choice)
     {
      case 1:
        addTask(taskManager);
        break;
      case 2:
        updateTask(taskManager);
        break;
      case 3:
        deleteTask(taskManager);
        break;
      case 4:
        listTasks(taskManager);
        break;
      case 5:
        searchTasks(taskManager);
        break;
      case 6:
        listCompletedTasks(taskManager);
        break;
      case 7:
        listIncompleteTasks(taskManager);
        break;
      case 8:
        toggleTaskCompletion(taskManager);
        break;
      case 9:
        print('Exiting the application.');
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void printMenu() 
{
  print('\nTask Management System');
  print('1. Add a new task');
  print('2. Update a task');
  print('3. Delete a task');
  print('4. List all tasks');
  print('5. Search tasks');
  print('6. List completed tasks');
  print('7. List incomplete tasks');
  print('8. Toggle the completion status of a task');
  print('9. Exit');
  print('Enter your choice (1-9): ');
}

int getUserChoice()
 {
  while (true) {
    try {
      return int.parse(stdin.readLineSync()!);
    } catch (e) {
      print('Invalid input. Please enter a number between 1 and 9.');
    }
  }
}

void addTask(TaskManager taskManager) 
{
  print('Enter task title: ');
  String title = stdin.readLineSync()!;
  print('Enter task description: ');
  String description = stdin.readLineSync()!;
  Task task = Task(title: title, description: description);
  taskManager.addTask(task);
  print('Task added successfully.');
}

void updateTask(TaskManager taskManager) 
{
  listTasks(taskManager);
  print('Select the task number to update:');
  int index = getUserChoice() - 1;

  if (index < 0 || index >= taskManager.getTasks().length) {
    print('Invalid task number.');
    return;
  }

  print('Enter new task title: ');
  String title = stdin.readLineSync()!;
  print('Enter new task description: ');
  String description = stdin.readLineSync()!;
  Task updatedTask = Task(
      title: title,
      description: description,
      isCompleted: taskManager.getTasks()[index].isCompleted);

  taskManager.updateTask(index, updatedTask);
  print('Task updated successfully.');
}

void deleteTask(TaskManager taskManager)
 {
  listTasks(taskManager);
  print('Select the task number to delete:');
  int index = getUserChoice() - 1;

  if (index < 0 || index >= taskManager.getTasks().length) 
  {
    print('Invalid task number.');
    return;
  }

  taskManager.deleteTask(index);
  print('Task deleted successfully.');
}

void listTasks(TaskManager taskManager) {
  List<Task> tasks = taskManager.getTasks();
  if (tasks.isEmpty) {
    print('No tasks found.');
  } 
  else 
  {
    for (int i = 0; i < tasks.length; i++) {
      print('${i + 1}. ${tasks[i]}');
    }
  }
}

void searchTasks(TaskManager taskManager) 
{
  print('Enter search term: ');
  String searchTerm = stdin.readLineSync()!;
  List<Task> results = taskManager.searchTasks(searchTerm);

  if (results.isEmpty)
   {
    print('No tasks found matching "$searchTerm".');
  } else {
    print('Search results:');
    for (var task in results)
     {
      print(task);
    }
  }
}

void listCompletedTasks(TaskManager taskManager)
 {
  List<Task> tasks = taskManager.getCompletedTasks();
  if (tasks.isEmpty)
   {
    print('No completed tasks found.');
  } else {
    for (var task in tasks) {
      print(task);
    }
  }
}

void listIncompleteTasks(TaskManager taskManager) 
{
  List<Task> tasks = taskManager.getIncompleteTasks();
  if (tasks.isEmpty) 
  {
    print('No incomplete tasks found.');
  } 
  else
   {
    for (var task in tasks) 
    {
      print(task);
    }
  }
}

void toggleTaskCompletion(TaskManager taskManager)
 {
  listTasks(taskManager);
  print('Select the task number to toggle:');
  int index = getUserChoice() - 1;

  if (index < 0 || index >= taskManager.getTasks().length)
   {
    print('Invalid task number.');
    return;
  }

  taskManager.toggleTaskCompletion(index);
  print('Task completion status toggled successfully.');
}
