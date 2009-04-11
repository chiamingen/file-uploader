import flash.net.FileReference;


class MathExtra {
	public static function formatDecimals(num, digits) {
        //if no decimal places needed, we're done
        if (digits <= 0) {
                return Math.round(num);
        }
        //Math floor the number to specified decimal places
        //e.g. 12.3456 to 3 digits (12.346) -> mult. by 1000, round, div. by 1000
        var tenToPower = Math.pow(10, digits);
        var cropped = String(Math.floor(num * tenToPower) / tenToPower);
        //add decimal point if missing
        if (cropped.indexOf(".") == -1) {
                cropped += ".0";  //e.g. 5 -> 5.0 (at least one zero is needed)
        }

        //finally, force correct number of zeroes; add some if necessary
        var halves = cropped.split("."); //grab numbers to the right of the decimal
        //compare digits in right half of string to digits wanted
        var zerosNeeded = digits - halves[1].length; //number of zeros to add
        for (var i=1; i <= zerosNeeded; i++) {
                cropped += "0";
        }
        return(cropped);
	}
	
	public static function readableSize(size_in_bytes:Number):String {
		var gb_size = 1073741824.0
  		var mb_size = 1048576.0
 		var kb_size = 1024.0
		
		var readable_size:String = "";
		
		if (size_in_bytes == 1) {
			readable_size = "1 byte";
		} else if (size_in_bytes < kb_size) {
			readable_size = size_in_bytes + " bytes";
		} else if (size_in_bytes < mb_size) {
			readable_size = MathExtra.formatDecimals(size_in_bytes / kb_size, 2) + " kb";
		} else if (size_in_bytes < gb_size) {
			readable_size = MathExtra.formatDecimals(size_in_bytes / mb_size, 2) + " mb";
		} else {
			readable_size = MathExtra.formatDecimals(size_in_bytes / gb_size, 2) + " gb";
		}
		return readable_size;
	}
}