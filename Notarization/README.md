# Sign and notarize DropAddDate

Signing and notarizing the applet before distribution will allow users to run the applet without an error from [Gatekeeper](https://support.apple.com/en-us/HT202491).

## Pre-requisites

For signing and notarization, you need the following things:

1. Xcode 10 or later installed on your Mac.
2. An [Apple Developer Connection](https://developer.apple.com/) account.
3. [A one-time password for your ADC account’s Apple ID](https://support.apple.com/HT204397).

## Signing

Clear the application of extended attributes:

`sudo xattr -rc <DropAddDate.app>`

Codesign the applet with a Developer ID Application Certificate:

`codesign --force --options runtime --entitlements Properties/Entitlements.plist --deep --sign "<Developer ID Application: Your Name (ABCDE1245Z)>" <DropAddDate.app>`

Once signed, verify the signature using a command like:

`codesign -dv --verbose=4 <DropAddDate.app>`

## Notarizing

The next thing needed is to get the app ready for upload to Apple for notarization. For this, you’ll need to compress your application inside of a .zip file. Then:

`xcrun altool --notarize-app --primary-bundle-id "ch.superpixel.applet.DropAddDate" --username "<Your Apple Developer Account ID (E-Mail)>" --password "<One-time password for your Apple Developer Account account’s Apple ID>" --file "<DropAddDate.zip>"`

On success we get an RequestUUID like be136ed3-3888-44e1-87ed-0e5c8c13cdb5. To validate that the notarization was successful, run this command:

`xcrun altool --notarization-info <Your RequestUUID you got> --username "<Your Apple Developer Account ID (E-Mail)>" --password "<One-time password for your Apple Developer Account account’s Apple ID>"`

Once the notarization has been generated for the app, the next step is to attach, or staple, the notarization to the app. To do this, run the following command:

`xcrun stapler staple <DropAddDate.app>`

To validate that the stapling was successful, do this:

`stapler validate -v <DropAddDate.app>`

## Automated Signing and Notarization

Signing and Notarization can be automated by using ['SD Notary' from Late Night Software](https://latenightsw.com/sd-notary-notarizing-made-easy/).
