# buffaloretailgroupmap

This is to be a maps app for Buffalo stores, shops, retail, whatever.

## Getting Started

I'm just learning Flutter, so this will be messy and probably wrong in places.  But it should work!

need to figure out, or rather remember how, to get the google maps/api to work locally for ios.


icons generation is the suuuuuuuuuuuck!
https://www.iconsgenerator.com/Home/AppIcons


you should probably understand xcode
and how signing works for ios/xcode

and cocoapods.  and what to do when cocoapods gets stuck.
and gradle for android.

*The images for each store are the fields ImageName and Image1.  I know, this is soo bad.  Image2 is not used anywhere yet.
*Some of the Google Cloud resources are under my personal email/account and some are under my companies/account.  
*There is no configuration as code yet.  This was all setup via point/click and no yaml files exists anywhere yet.
*There is no dev/test/prod kind of environment setup yet.  The data you modify in Firebase Storage/Firebase database is LIVE.  You can break the app for everyone so be careful. Or setup your environments.
*If you rev the verison for ios/app store, you need to change the <CFBundleShortVersionString> in info.plist.  Once you release a version in the ios app store,and it approved you can't change.  This makes sense actually when you think about it.


