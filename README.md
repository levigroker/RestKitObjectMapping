RestKitObjectMapping
====================
An extraction of the ObjectMapping portion of the [RestKit](http://restkit.org) framework, such that it can be used solely for mapping between JSON and NSObjects.

It is intended to be used in iOS 5 and later, and uses `NSJSONSerializer` (as opposed to JSONKit).

### Installing

If you're using [CocoPods](http://cocopods.org) it's as simple as adding this to your `Podfile`:

	pod 'RestKitObjectMapping', :git => 'https://github.com/levigroker/RestKitObjectMapping.git'

### Documentation

Please refer to the excellent [Object Mapping documentation](https://github.com/RestKit/RestKit/wiki/Object-mapping) from the RestKit team.

If there's interest, and I have time, I'll document my additions and intended usage patterns.

#### Disclaimer and Licence

* I'm not affiliated with the RestKit team.
* The changes I've made are minor, with the intent to pull future changes from the RestKit team in to this source base.
* All my additions and changes remain under the Apache 2.0 licence set forth by the RestKit project.