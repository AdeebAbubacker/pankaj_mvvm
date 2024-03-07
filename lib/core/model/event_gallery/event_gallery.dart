import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'misc.dart';
import 'paginate.dart';

part 'event_gallery.g.dart';

@JsonSerializable()
class EventGallery {
	int? status;
	int? count;
	String? message;
	List<Datum>? data;
	Misc? misc;
	Paginate? paginate;

	EventGallery({
		this.status, 
		this.count, 
		this.message, 
		this.data, 
		this.misc, 
		this.paginate, 
	});

	factory EventGallery.fromJson(Map<String, dynamic> json) {
		return _$EventGalleryFromJson(json);
	}

	Map<String, dynamic> toJson() => _$EventGalleryToJson(this);
}
