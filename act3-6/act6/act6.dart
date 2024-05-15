class Stack<T> {
  List<T> _stack;

  Stack() : _stack = [];
  // Pushes an element onto the stack
  void push(T element) {
    _stack.add(element);
  }

  // Removes and returns the element at the top of the stack
  T pop() {
    if (isEmpty()) {
      throw StateError('Cannot pop from an empty stack');
    }
    return _stack.removeLast();
  }

  // Checks if the stack is empty
  bool isEmpty() {
    return _stack.isEmpty;
  }
}

void main() {
  // Create a new stack
  var stack = Stack<int>();

  // Push some elements onto the stack
  stack.push(1);
  stack.push(2);
  stack.push(3);

  // Pop elements from the stack
  print(stack.pop()); // Output: 3
  print(stack.pop()); // Output: 2

  // Check if the stack is empty
  print(stack.isEmpty()); // Output: false

  // Pop remaining element
  print(stack.pop()); // Output: 1

  // Check if the stack is empty again
  print(stack.isEmpty()); // Output: true
}
