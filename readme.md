# AppVersioning

Very simple version manager of iOS application.

- Get Current Version
- Save Current Version
- Compare Current Version with Saved Version.

That's all!

## Installation

``` sh
pod 'AppVersioning'
```

## Usage

``` objc
+ (NSString *)currentVersion;

+ (void)saveCurrentVersion;

+ (NSString *)previouslySavedVersion;

+ (BOOL)compareCurrentWithSavedVersion;
```


### Save Current Version When Close Application

Write to `AppDelegate` .

```objc
- (void)applicationDidEnterBackground:(UIApplication *) application {
    [AppVersioning saveCurrentVersion];
}
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT