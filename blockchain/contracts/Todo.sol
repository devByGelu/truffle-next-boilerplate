// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9;

contract Todo {
  struct STodo {
    string description;
  }

  mapping(address => STodo[]) public todos;

  function addTodo(string memory description)
    public
    returns (uint256 addedIndex)
  {
    todos[msg.sender].push(STodo(description));
    return todos[msg.sender].length;
  }

  function remove(uint256 index) public returns (uint256 newLength) {
    delete todos[msg.sender][index];
    return todos[msg.sender].length;
  }

  function getTodos() public view returns (string[] memory) {
    STodo[] memory t;
    t = todos[msg.sender];
    string[] memory data = new string[](t.length);
    for (uint256 index = 0; index < t.length; index++) {
      data[index] = t[index].description;
    }
    return data;
  }
}
