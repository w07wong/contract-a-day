pragma solidity ^0.4.11;

contract LinkedList {
    struct Item {
        bytes32 name;
    }
    
    struct List {
        bytes32 name;
        uint numItems;
        mapping (uint => Item) items;
    }
    
    uint numLists;
    mapping (uint => List) lists;
    
    function newList(bytes32 n) returns (uint listID) {
        listID = numLists++;
        lists[listID] = List(n, 0);
    }
    
    function packList(uint listID, bytes32 name) {
        List storage c = lists[listID];
        c.items[c.numItems++] = Item(name);
    }
    
    function listCount() constant returns (uint n) {
        return numLists;
    }

    function getListName(uint listID) constant returns (bytes32 n) {
        List storage c = lists[listID];
        return c.name;
    }
    
    function getItems(uint listID) constant returns (bytes32[] selectedItems) {
        bytes32[] storage tempItems;
        List storage c = lists[listID];
        for (uint i = 0; i < c.numItems; i++) {
            tempItems.push(c.items[i].name);
        }
        selectedItems = tempItems;
        return selectedItems;
    }
    
}
