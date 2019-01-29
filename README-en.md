# PLUG SDK

The PLUG SDK is a dedicated in-app community library for mobile games, which lets mobile gamers use community features without leaving games while they are playing. It is easy to apply the PLUG SDK  to your project.

As a proven SDK, which has been used in many mobile games, this lets you simply and quickly add community features in your game.
 
![PLUG SDK](http://static.naver.net/m/cafe/glink/promotion/cafe_sdk_open/img_intro1_20151111.png)

## How To Get Started 

### Become a Partner

You should apply to our partner program to apply the PLUG SDK to your app. Please fill out the form after downloads and send it via email.

- [Downloads of partnership registration form](https://github.com/naver/cafe-sdk-android/raw/master/guide/alliance/%EB%84%A4%EC%9D%B4%EB%B2%84%EC%B9%B4%ED%8E%98SDK_%EC%A0%9C%ED%9C%B4%EC%96%91%EC%8B%9D_%EA%B2%8C%EC%9E%84%EC%82%AC%EB%AA%85_%EA%B2%8C%EC%9E%84%EB%AA%85_ver.2.0.0.xlsx)
- Email address of a partnership contact: <a href="mailto:dl_naverplugpartner@navercorp.com">dl_naverplugpartner@navercorp.com</a>

You can manage the PLUG SDK content on the Settings page from your computer after the partnership process is completed.

### Documentation

- [PLUG documents](https://www.gitbook.com/book/plug/plug-sdk-ios/details/en)
- [Downloads of latest library and sample project files](https://github.com/naver/cafe-sdk-ios/archive/master.zip)

## Communication

If you have any questions regarding working this SDK, please [visit our issue page for iOS](https://github.com/naver/cafe-sdk-ios/issues).

## Usages

### 1. Requirements

- Applications: iOS 9.0 or later (64-bit architecture and bitcode supported)
- Video recording: iOS 9.0 or later, A7 or later
- IDE: XCode 9.0 or later

### 2. Configure a Project

To use the PLUG SDK, you must set up a development environment in Xcode as follows:

1. Go to **Build Settings > Other Linker Flags** and add the **-ObjC** option.  
2. Add the following libraries to your project. The libraries are included in the [sample project](https://github.com/naver/cafe-sdk-ios/archive/master.zip) you downloaded.    
    - SDWebImage  
    - FLAnimatedImage  
    - AFNetworking  
    - NAVER Login  
    - OpenSSL
3. Go to **Build Phases > Link Binary With Libraries** and add the following libraries. 
    - MobileCoreServices.framework
    - SystemConfiguration.framework
    - MediaPlayer.framework
    - AVFoundation.framework
    - CoreMedia.framework
    - AssetsLibrary.framework
    - Security.framework
    - ImageIO.framework
    - QuartzCore.framework
    - WebKit.framework
    - ReplayKit.framework 
4. Go to **Info.plist** and add User Privacy.
    - NSCameraUsageDescription
    - NSPhotoLibraryUsageDescription
    
### 3. Initialize the PLUG SDK

Initializing the PLUG SDK will vary depending on the supported language.

#### 3.1 Support for Korean only (NAVER Cafe)

Configure the initialization information below to initialize the PLUG SDK that supports Korean only.

- Client ID (ClientId) and client secret (ClientSecret) you received after registering your application in [NAVER Login Developers](https://developers.naver.com/apps/#/register?api=nvlogin)
- Cafe ID you received after creating your Cafe in [NAVER Cafe](http://section.cafe.naver.com/)
- [URL Scheme](https://developers.naver.com/apps/#/myapps) you entered after registering your application in [NAVER Login Developers](https://developers.naver.com/apps/#/register?api=nvlogin)
- Parent view controller where PLUG is loaded
- Channel code (set this value to "KOREAN" if only Korean channel is used)

```objective-c
    [[NCSDKManager getSharedInstance] setNaverLoginClientId:@"197CymaStozo7X5r2qR5"
                                     naverLoginClientSecret:@"evCgKH1kJL"
                                                     cafeId:28290504];
                                                     
    [[NCSDKLoginManager getSharedInstance] setNaverLoginURLScheme:@"gLinkSample"];
    
    [[NCSDKManager getSharedInstance] setParentViewController:self];
    
    [[NCSDKManager getSharedInstance] setChannelCode:KOREAN];
```

#### 3.2 Support for languages other than Korean

Configure the initialization information below to initialize the PLUG SDK that supports languages other than Korean.

- consumerKey: Community Key you received after creating your community
- consumerSecretKey: Community Scret Key you received after creating your community
- cummunityNo: Community No received after creating your community
- loungeNo: Lounge No received after creating your lounge
- Parent view controller where PLUG is loaded

```objective-c
    [[NCSDKManager getSharedInstance] setGlobalConsumerKey:@"PLUGTESTKEY"
                                      globalConsumerSecret:@"PLUGTESTSECRET"
                                      globalCommunityNo:1
                                      globalLoungeNo:58];
                                              
    [[NCSDKManager getSharedInstance] setParentViewController:self];
```

> **How to check your community ID and consumer key**  
> Visit http://g.cafe.naver.com/plugsample/manage/consumer and log in to your community using the account with manager privileges.  
> You can find the information in **Settings > Communities > In-App Community Settings** as shown in the image below.   
> ![In-App Community Settings](https://plug.gitbooks.io/plug-sdk-android/content/assets/wiki-plug-setting.png)

### 4. Start the PLUG SDK

Start the PLUG SDK after initialization is completed.

#### 4.1 presentMainViewController: method

The presentMainViewController: method starts the PLUG SDK. The code below shows how to implement the presentMainViewController: method.

```objective-c
[[NCSDKManager getSharedInstance] presentMainViewController];

```

> **NCSDKManager class**  
> The NCSDKManager class controls the PLUG SDK. For more information about features which the NCSDKManager class can control, see "[FEATURE LIST](https://plug.gitbooks.io/plug-sdk-ios/content/en/index.html)".

#### 4.2 Screen orientation

The  PLUG SDK supports both portrait mode and landscape mode. The code below shows how to execute landscape mode.

```objective-c
[[NCSDKManager getSharedInstance] setOrientationIsLandscape:YES];

```

## Files and Folders 

|Name	|Description|
|---|---|
|guide/	|Folder for PLUG SDK documentation|
|lib/	|Folder for iOS PLUG SDK library|
|sample/external-lib	|Folder for external libraries|
|sample/navercafesdk-sample-ios	|Folder for Xcode sample project|
|LICENSE 	|License file|
|README.md	|Readme file|

## Dependent Libraries  

You should add the following libraries to your project and build together with the PLUG SDK in order to use the PLUG SDK. The libraries are included in the sample project.

- [NAVER Login](https://nid.naver.com/devcenter/docs.nhn?menu=IOS) (version 4.0.7)
- [AFNetworking](https://github.com/AFNetworking/AFNetworking) (version 3.1.0)

> Both 2.x and 3.x versions are available. The PLUG SDK is tested on AFNetworking 3.1.0.

- [SDWebImage](https://github.com/rs/SDWebImage) (version 3.8.2)
- [FLAnimatedImage](https://github.com/Flipboard/FLAnimatedImage) (version 1.0.12)
- ApiGateway-1.5.0

## License 

The intellectual property right of the PLUG SDK is owned by NAVER Corporation.

```
NAVER Cafe SDK for iOS

Copyright 2015 NAVER Corp.
All rights reserved.

Unauthorized use, modification and redistribution of this software are strongly prohibited.
```

 PLUG SDK 2.x, 3.x versions are no longer supported.
