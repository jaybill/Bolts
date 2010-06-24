/*
	File: JQuery-based Multi-Select Picker
		An unobtrusive and degrading multiple-value form field.
		Note: This script assumes the target select element is an only child
		(it's the only element inside of its parent).

	About: Compatibility
		Tested with Firefox for OS X and jQuery versions 1.2.6 and 1.3.2.
		Might work with earlier versions of jQuery.
		Does not work in Safari, but will still degrade in Safari just fine.

	About: Author
		Rich Joslin <http://richjoslin.com>
*/
function initPickers() {
	$('select.jq-picker').each(function () {
		var sourceSelect = $(this);
		var outerParent = sourceSelect.parent();
		outerParent.append("<div class=\"jq-picker-outer\"></div>");
		var outerWrapper = outerParent.find('div.jq-picker-outer');
		outerWrapper.append(sourceSelect);
		sourceSelect.bind('click', function () {
						
			if ($(this).attr('class') == 'jq-picker-source') {
				destSelect.append($(this).children('option[value="'+$(this).val()+'"]').clone(true));
				$(this).children('option[value="'+$(this).val()+'"]').remove();
			} else if ($(this).attr('class') == 'jq-picker-dest') {
				sourceSelect.append($(this).children('option[value="'+$(this).val()+'"]').clone(true));
				$(this).children('option[value="'+$(this).val()+'"]').remove();
			}
			clearSelections(sourceSelect, destSelect);
		});
		destSelect = sourceSelect.clone(true);
		sourceSelect
			.attr('name', 'temporary_source')
			.attr('id', 'temporary_source')
			.attr('class', 'jq-picker-source');
		destSelect.attr('class', 'jq-picker-dest');
		outerWrapper.append(destSelect);
		destSelect.find('option').each(function () {
			if (!$(this).attr('selected')) {
				$(this).remove();
			}
		});
		sourceSelect.find('option').each(function () {
			if ($(this).attr('selected')) {
				$(this).remove();
			}
		});
		clearSelections(sourceSelect, destSelect);
	});
	$('form').bind('submit', function () {
		$('select.jq-picker-dest').find('option').attr('selected', true);
	});
}

function clearSelections(sourceSelect, destSelect) {
	destSelect.find('option').attr('selected', false);
	sourceSelect.find('option').attr('selected', false);
}

$(document).ready(function () {
	// this script does not work in Safari, but it will still degrade just fine
	// if (!$.browser.safari) {
		initPickers();
	// }
});
