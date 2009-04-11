import flash.net.FileReference;
import MathExtra;

class File {
	private static var uniqueID:Number = 1;
	private var id:String;
	private var fileRef:FileReference;
	
	public function File(fileRef) {
		this.id = "file_" + File.uniqueID;
		File.uniqueID++;
		this.fileRef = fileRef;
	}
	
	public function getID():String {
		return id;
	}
	
	public function getFileRef():FileReference {
		return fileRef;
	}
	
	public function getName():String {
		return fileRef.name;
	}
	
	public function getSize():String {
		return MathExtra.readableSize(fileRef.size);
	}
	
}