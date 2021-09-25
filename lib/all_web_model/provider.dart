class Provider {
	String? name;
	String? favIcon;
	String? favIconBase64Encoding;

	Provider({this.name, this.favIcon, this.favIconBase64Encoding});

	factory Provider.fromJson(Map<String, dynamic> json) => Provider(
				name: json['name'] as String?,
				favIcon: json['favIcon'] as String?,
				favIconBase64Encoding: json['favIconBase64Encoding'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'favIcon': favIcon,
				'favIconBase64Encoding': favIconBase64Encoding,
			};
}
