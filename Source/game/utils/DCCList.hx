package game.utils;

import openfl.errors.*;
import openfl.utils.Function;
/**
 * ...
 * @author Andrii Andriushchenko
 */
class DCCList<T>
{
	private var callBack:Function;
	
	public var length(default, null):UInt;

	private var head : Node<T>;

	public function new()
	{
		length = 0;
	}
	
	public function onListChanged(func:Function):Void {
		callBack = func;
	}

	// Add element on last position in List
	public function add(item:T)
	{
		var newNode = new Node(item, length);

		if (isEmpty())
		{
			head = newNode;
			head.prevNode = newNode;
			head.nextNode = newNode;
		}
		else
		{
			newNode.prevNode = head.prevNode;
			newNode.nextNode = head;
			head.prevNode.nextNode = newNode;
			head.prevNode = newNode;
		}

		length++;
		
		tryCallBack();
	}
	
	public function addAt(item:T, index:UInt)
	{
		if(index < 0 && index > length){
			throw('Index $index out of range');
		}
		
		if(index == 0){
			this.push(item);
			return;
		}else if(index == length){
			this.add(item);
			return;
		}
		
		var iterator:UInt = 0;
		var tempNode:Node<T> = head;

		while (iterator < index)
		{
			tempNode = tempNode.nextNode;
			iterator++;
		}
		
		var newNode = new Node(item, iterator);
		tempNode.prevNode.nextNode = newNode;
		newNode.prevNode = tempNode.prevNode;
		tempNode.prevNode = newNode;
		newNode.nextNode = tempNode;
		
		length++;
		correctListIndex();
	}

	// Add element on first postion in List
	public function push(item:T)
	{
		var newNode = new Node(item, 0);

		if (isEmpty())
		{
			head = newNode;
			head.prevNode = newNode;
			head.nextNode = newNode;
		}
		else
		{
			newNode.nextNode = head;
			newNode.prevNode = head.prevNode;
			head.prevNode.nextNode = newNode;
			head.prevNode = newNode;
			head = newNode;
		}

		length++;

		correctListIndex();
		tryCallBack();
	}

	public function removeElement(element:T)
	{
		var iterator:UInt = 0;
		var tempNode:Node<T> = head;

		while (iterator < length)
		{
			if (tempNode.currentItem == element)
			{
				removing(tempNode);
				return;
			}

			tempNode = tempNode.nextNode;
			iterator++;
		}

		throw('Not found: $element in List' );
	}

	public function removeElementByIndex(index:UInt)
	{
		if (index < 0 && index >= length){
			throw('Index $index out of range');
			return;
		}
		
		var iterator:UInt = 0;
		var tempNode:Node<T> = head;

		while (iterator < index)
		{
			tempNode = tempNode.nextNode;
			iterator++;
		}

		removing(tempNode);
	}

	// Return element by index in List
	public function elementByIndex(index:UInt):Null<T>
	{
		if (length <= index)
		{
			return null;
		}

		var iterator:UInt = 0;
		var tempNode:Node<T> = head;

		while (iterator < index)
		{
			tempNode = tempNode.nextNode;
			iterator++;
		}

		return tempNode.currentItem;
	}

	// Return index of search element
	public function indexOfElement(node:T):Null<UInt>
	{
		if (head == null)
		{
			return null;
		}

		var tempNode:Node<T> = head;
		var iterator:UInt = 0;
		while (iterator < length)
		{
			if (tempNode.currentItem == node){
				break;
			}
			tempNode = tempNode.nextNode;
			iterator++;
		}

		return tempNode.index;
	}
	
	//// Return has list elemnt or not
	//public function hasElememt(node:T):Bool
	//{
		//if (head == null)
		//{
			//return null;
		//}
//
		//var tail:Node<T> = head.prevNode;
		//var tempNode:Node<T> = head;
		//
		//do
		//{
			//if (node == tempNode){
				//return true;
			//}
			//tempNode = tempNode.nextNode;
		//}
		//while (tempNode != tail)
//
		//return false;
	//}
	
	public function nextElement(item:T):T
	{
		var tempNode = findNodeByItem(item);
		return (tempNode != null ) ? tempNode.nextNode.currentItem : null;
	}
	
	public function prevElement(item:T):T
	{
		var tempNode = findNodeByItem(item);
		return (tempNode != null ) ? tempNode.prevNode.currentItem : null;
	}

	// Check the list for Empty
	public function isEmpty():Bool
	{
		return length == 0;
	}

	// Return first element of list or null if list Empty
	public function firstElement ():Null<T>
	{
		return if (isEmpty()) null else head.currentItem;
	}

	// Return last element of list or null if list Empty
	public function lastElement():Null<T>
	{
		return if (isEmpty()) null else head.prevNode.currentItem;
	}
	
	public function clear():Void
	{
		head = null;
		callBack = null;
		length = 0;
	}
		
	public inline function iterator() : ListIterator<T> {
		return new ListIterator<T>(head);
	}

	// Corrected all index in list when add or remove some elements (add to start or inject to list)
	private function correctListIndex()
	{
		var iterator:UInt = 0;
		var tempNode:Node<T> = head;

		while (iterator < length)
		{
			tempNode.index = iterator++;
			tempNode = tempNode.nextNode;
		}
	}
	
	private function removing(tempNode:Node<T>){
		
		if (tempNode == head)
		{
			head = tempNode.nextNode;
		}

		tempNode.prevNode.nextNode = tempNode.nextNode;
		tempNode.nextNode.prevNode = tempNode.prevNode;
		tempNode.destroy();
		length--;
		correctListIndex();
		tryCallBack();
	}
	
	// need add iteration
	private function findNodeByItem(item:T):Node<T>
	{
		var iterator:UInt = 0;
		var node:Node<T> = head;
		
		do{
			if (node.currentItem == item) return node;
			else node = node.nextNode;
		}
		while (iterator < length);
		
		return null;
	}
	
	private function tryCallBack(){
		
		if (callBack != null ) callBack();
		//try{
			//callBack();
		//}
		//catch (e:Error){
			////do nothig
		//}
	}
	
	private function get_length():UInt
	{
		return length;
	}
	
}

private class Node<T>
{

	public var nextNode:Node<T>;
	public var prevNode:Node<T>;
	public var currentItem:T;

	public var index:UInt;

	public inline function new (item:T, index:UInt)
	{
		this.currentItem = item;
		this.index = index;
	}

	public function destroy()
	{
		nextNode = null;
		prevNode = null;
		currentItem = null;
	}
}

private class ListIterator<T> {
	var head:Node<T>;
	var current:Node<T>;

	public inline function new(head:Node<T>) {
		this.head = head;
		this.current = head;
	}

	public inline function hasNext():Bool {
		return current != null;
	}

	public inline function next():T {
		var val = current.currentItem;
		current = (current.nextNode != head) ? current.nextNode : null;
		return val;
	}
}