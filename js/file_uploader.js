function all_files_uploaded() {
}

function getFlashMovie(movieName) {
	var isIE = navigator.appName.indexOf("Microsoft") != -1;
	return (isIE) ? window[movieName] : document[movieName];
}

function file_completed(fileID) {
	$('#' + fileID + ' .select').html('<img src="images/tick.png">');
}

function remove(e) {
	var remove_img = (window.event) ? e.srcElement : e.target;
	var file = $(remove_img).parents(".file")
	var file_id = file.attr("id");
	getFlashMovie("uploader").removeFileByID(file_id);
	file.remove();
}

function display_errors(msg) {
	alert(msg);
}

function file_progress(fileID, percent) {
	var file = document.getElementById(fileID);
	var from = 800;
	var to = (800 - file.offsetWidth)
	var range = from - to;
	var padding = -800 + (range * percent);
	file.style.backgroundPosition = padding + "px 0px";
}

function add_file(fileID, filename, filesize) {
	var html =  '<div id="' + fileID + '" class="file">'
	html += 		'<div class="name">' + filename + '</div>';
	html += 		'<div class="size">' + filesize + '</div>';
	html +=			'<div class="select"><a href="#" class="remove"><img src="images/remove.png" /></a></div>';
	html +=			'<div style="clear:both;"></div>';
	html +=		'</div>';
	$('#file_collection').append(html);
	$(".remove").click(remove);
}

function update_status(num_of_file, total_size) {
	$('#num_of_file').html(num_of_file);
	$('#total_size').html(total_size);
}


function file_start(fileID) {
	$('#file_collection').scrollTo('#' + fileID, 1000, {offset: {top:-110} });
}

function upload() {
	$('.select').html('');
	getFlashMovie("uploader").upload();

