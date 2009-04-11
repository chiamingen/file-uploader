import flash.net.FileReference;
import MathExtra;

class FileQueue {
	private var list:Array;
	
	public function FileQueue() {
		list = new Array();
	}
	
	public function push(file:File):Void {
		list.push(file);
	}
	
	public function shift():Object {
		return list.shift();
	}
	
	public function findFileByFileRef(fileRef:FileReference):File {
		trace("Length: " + list.length);
		for(var i = 0; i < list.length; i++) {
			var file:File = list[i]
			trace("File: " + file);
			if (file.getFileRef() === fileRef) {
				return file;
			}
		}
		return null;
	}
	
	public function removeFileByFileID(fileID:String):Void {
		for(var i = 0; i < list.length; i++) {
			var file:File = list[i]
			if (file.getID() == fileID) {
				list.splice(i, 1);
				break;
			}
		}
	}
	
	public function getTotalFileSize():String {
		var total:Number = 0;
		for(var i = 0; i < list.length; i++) {
			var file:File = list[i]
			total += file.getFileRef().size
		}
		return MathExtra.readableSize(total);
	}
	
	public function length():Number {
		return list.length;
	}
	
	public function showInfo():Void {
		for(var i = 0; i < list.length; i++) {
			var file:File = list[i]
			trace("ID = " + file.getID());
			trace("Name = " + file.getName());
			trace("Size = " + file.getSize());
		}
	}
}