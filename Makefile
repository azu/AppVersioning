test:
	xcodebuild clean test \
		-sdk iphonesimulator \
		-workspace AppVersioning.xcworkspace \
		-scheme AppVersioningTests \
		-configuration Debug \
		-destination "name=iPhone Retina (4-inch),OS=7.0"
