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

Most/all the cloud resources are in the Google Cloud Platform. 
Project name in GCP: BRG Map App Google Play

CI/CD
Well, automated builds anyway. There are no automated tests for the project.  The builds are run on CodeMagic, codemagic.io.  The name of the App/build there is fluttershops.  The build is also point and click, there is no yaml file yet.  CodeMagic has some secrets, the FIREBASE_API_KEY and the Google Maps api key MAPS_API_KEY.
https://codemagic.io/app/5f1f117ca98453821abe1a1a/

IOS distribution:
This is handled in AppStore Connect.  Log into AppStore Connect, and go to the TestFlight area.  Any builds that are for IOS and pass the build in CodeMAgic are automatically provided to TestFlight. It takes a few minutes for AppStore Connect to process the new build (the status goes from 'processing' to 'manage missing compliance').  Once it does you need to manually answer some questions for the build - they mostly about enryption.  The first question needs to be answered 'yes', the remainder 'no' as there isn't any added encryption I'm using. Once you get a link in the build column, it's available to be installed via TestFlight app.  

How do I get users on TestFlight so they can test my app?  
Still confuses me, but they have to be invited from AppStore Connect.  AST also has external vs internal teams you can setup, I haven't setup external, only an internal team. Use the 'Users and Access' menu item to add people by their email address so they get an invite to test the app.

IOS Release:
To release a new version, you have to create a new version on the App menu for your application.  Once you do this, one of the options is to pick the build version to use - this is where you pick the desired version to release.  This must be done manually.  You also have a chance to add text describing the changes that were made.

The assets, images for stores such as logo, storefront is stored in Firebase.  At this time, there isn't a great tool/ui to mass upload/modify images in Firebase.  All of the images used in the app are in the github repo, https://github.com/wyldebill/fluttershops_assets.  

The store information (name, gps coords, hours of operation) for each store is also held in this repo, in the nested folder /nodefirestoreimprot.  The file is named users.json, but it's store information.  You will need to produce a key.json file for accessing Firebase.  There is a readme with youtube.com urls and the command line to use.  The npm package is https://www.npmjs.com/package/node-firestore-import-export





