# PLUG SDK

PLUG SDK는 모바일 게임 사용자가 게임 도중 게임을 벗어나지 않고 게임의 커뮤니티와 소통할 수 있도록 제공되는 인앱 커뮤니티 라이브러리입니다. 간단한 조작으로 프로젝트에 PLUG SDK를 추가할 수 있습니다.

이미 많은 게임에 적용돼 검증된 PLUG SDK를 사용하면 손쉽게 커뮤니티 기능을 게임 안에 넣을 수 있습니다.
 
![PLUG SDK](http://static.naver.net/m/cafe/glink/promotion/cafe_sdk_open/img_intro1_20151111.png)

## How To Get Started 

### 제휴 신청

PLUG SDK를 앱에 적용하려면 PLUG SDK 제휴를 신청해야 합니다. 제휴 양식을 작성해 PLUG 제휴 담당자에게 메일로 제휴를 신청합니다.

- [제휴 양식 다운로드](https://github.com/naver/cafe-sdk-android/raw/master/guide/alliance/%EB%84%A4%EC%9D%B4%EB%B2%84%EC%B9%B4%ED%8E%98SDK_%EC%A0%9C%ED%9C%B4%EC%96%91%EC%8B%9D_%EA%B2%8C%EC%9E%84%EC%82%AC%EB%AA%85_%EA%B2%8C%EC%9E%84%EB%AA%85_ver.2.0.0.xlsx)
- PLUG 제휴 담당자 메일 주소: <a href="mailto:dl_naverplugpartner@navercorp.com">dl_naverplugpartner@navercorp.com</a>

제휴 신청이 완료되면 PC의 카페 관리 페이지에서 네이버 PLUG SDK 콘텐츠를 관리할 수 있습니다.

### 적용 가이드

- [PLUG 적용 가이드](https://www.gitbook.com/book/plug/plug-sdk-ios/details)
- [최신 버전 및 샘플 프로젝트 다운로드](https://github.com/naver/cafe-sdk-ios/archive/master.zip)

## Communication 

개발과 관련된 문의 사항은 PLUG 공식 카페를 사용합니다.

- [PLUG 공식 카페](http://cafe.naver.com/navercafesdk)
- [PLUG 공식 카페의 개발 문의 게시판](http://cafe.naver.com/ArticleList.nhn?search.clubid=28285034&search.menuid=13&search.boardtype=L)

## Usages

### 1. 요구 사항

- 애플리케이션 사용 환경: iOS 8.0 이상(64비트 아키텍처 지원, bitcode 지원)
- 동영상 녹화: iOS 9.0 이상, A7 이상
- 실시간 스트리밍: iOS 10.0 이상, A7 이상
- IDE: XCode 7.0 이상

### 2. 프로젝트 설정

PLUG SDK를 사용하려면 XCode에서 다음과 같이 개발 환경을 설정합니다.

1. **Build Settings**의 **Other Linker Flags**에 **-ObjC** 옵션을 추가합니다.  
2. 다운로드한 [샘플 프로젝트](https://github.com/naver/cafe-sdk-ios/archive/master.zip)에 포함된 다음 라이브러리를 프로젝트에 추가합니다.    
    - SDWebImage  
    - FLAnimatedImage  
    - AFNetworking  
    - 네이버 아이디로 로그인
3. **Build Phases**의 **Link Binary With Libraries**에 다음 라이브러리를 추가합니다. 추가한 라이브러리의 **Status**는 **Required**로 설정합니다.
    - AVKit.framework
    - AVFoundation.framework
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
    - ReplayKit.framework(라이브러리의 **Status**를 **Optional**로 설정합니다)
4. **Info.plist**의 사용자 권한 획득 옵션을 추가합니다.
    - NSCameraUsageDescription
    - NSPhotoLibraryUsageDescription
    
### 3. 초기화

PLUG SDK가 지원하는 언어에 따라 다음과 같이 PLUG SDK를 초기화합니다.

#### 3.1 PLUG SDK 초기화(한국어만 지원 - 네이버 카페)

한국어만 지원하는 PLUG SDK를 초기화할 때는 다음과 같은 초기화 정보를 설정합니다.

- [네이버 아이디로 로그인 개발자 센터](https://developers.naver.com/apps/#/register?api=nvlogin)에서 애플리케이션을 등록하고 받은 클라이언트 아이디(ClientId)와 클라이언트 시크릿(ClientSecret)
- [네이버 카페](http://section.cafe.naver.com/)에서 카페를 개설하고 받은 카페 ID
- [네이버 아이디로 로그인 개발자 센터](https://developers.naver.com/apps/#/register?api=nvlogin)에 애플리케이션을 등록할 때 입력한 [URL Scheme](https://developers.naver.com/apps/#/myapps)
- PLUG가 올라갈 부모 뷰 컨트롤러
- 채널 코드(한국어 채널만 사용할 때는 `KOREAN`으로 설정)

```objective-c
    [[NCSDKManager getSharedInstance] setNaverLoginClientId:@"197CymaStozo7X5r2qR5"
                                     naverLoginClientSecret:@"evCgKH1kJL"
                                                     cafeId:28290504];
                                                     
    [[NCSDKLoginManager getSharedInstance] setNaverLoginURLScheme:@"gLinkSample"];
    
    [[NCSDKManager getSharedInstance] setParentViewController:self];
    
    [[NCSDKManager getSharedInstance] setChannelCode:KOREAN];
```

#### 3.2 PLUG SDK 초기화(외국어만 지원)

외국어만 지원하는 PLUG SDK를 초기화할 때는 다음과 같은 초기화 정보를 설정합니다.

- consumerKey: 커뮤니티를 개설하고 받은 컨슈머 키(Consumer Key)
- consumerSecretKey: 커뮤니티를 개설하고 받은 컨슈머 시크릿(Consumer Secret Key)
- cummunityNo: 커뮤니티를 개설하고 받은 커뮤니티 No(cummunityNo)
- loungeNo: 라운지를 개설하고 받은 라운지 No(cummunityNo)
- PLUG가 올라갈 부모 뷰 컨트롤러

```objective-c
    [[NCSDKManager getSharedInstance] setGlobalConsumerKey:@"PLUGTESTKEY"
                                      globalConsumerSecret:@"PLUGTESTSECRET" 
                                      globalCommunityNo:1
                                      globalLoungeNo:58];
                                              
    [[NCSDKManager getSharedInstance] setParentViewController:self];
```

> **커뮤니티 ID와 컨슈머 키 확인**  
> 커뮤니티를 개설하고 받은 커뮤니티 ID와 컨슈머 키를 확인하려면 [커뮤니티 관리 페이지](http://g.cafe.naver.com/plugsample/manage/consumer)에 매니저 권한으로 접근하십시오.  
> 커뮤니티 관리 페이지에서 **Settings > Communities > In-App Community Settings** 메뉴를 선택하면 커뮤니티 ID와 컨슈머 키를 확인할 수 있습니다.   
> ![In-App Community Settings](https://plug.gitbooks.io/plug-sdk-android/content/assets/wiki-plug-setting.png)

### 4. PLUG SDK 시작

초기화가 완료되면 PLUG SDK를 실행합니다.

#### 4.1 presentMainViewController: 메서드

presentMainViewController: 메서드는 PLUG SDK를 시작하는 메서드입니다. 다음은 presentMainViewController: 메서드를 구현한 예입니다.

```objective-c
[[NCSDKManager getSharedInstance] presentMainViewController];

```

> **NCSDKManager 클래스**  
> NCSDKManager 클래스는 PLUG SDK를 제어하는 클래스입니다. NCSDKManager 클래스로 제어할 수 있는 기능에 관한 자세한 내용은 PLUG SDK 상세 가이드의 "[주요 기능 설명 상세](https://plug.gitbooks.io/plug-sdk-ios/content/ko/index.html)"를 참고하십시오.

#### 4.2 가로 모드, 세로 모드

PLUG SDK는 가로 모드와 세로 모드를 모두 지원합니다. 다음은 PLUG SDK를 가로 모드로 실행하는 예입니다.

```objective-c
[[NCSDKManager getSharedInstance] setOrientationIsLandscape:YES];

```

### 5. LIVE

PLUG SDK는 사용자가 게임 화면을 실시간 스트리밍 할 수 있는 기능을 제공합니다.

[라이브 상세 가이드](https://plug.gitbooks.io/plug-sdk-ios/content/ko/[%ED%95%9C]-%ED%94%8C%EB%9F%AC%EA%B7%B8-%EB%9D%BC%EC%9D%B4%EB%B8%8C.html)

![LIVE](https://cafeptthumb-phinf.pstatic.net/MjAxNzExMTRfMTE3/MDAxNTEwNjQ2MTk3MjM1.7ss4wFV1nGd0Q_Lk8jpQ_HV2pJv_MR_w7FbHg74NSHog.Tc4f5bQ7IWR8Wbnc5xGVVeTPK1lZ7NyyWcMdA4li1qUg.PNG.cafesdksupport/02.PNG?type=w740)


## Files and Folders

|폴더 및 파일 이름	|설명|
|---|---|
|guide/	|PLUG SDK 적용 가이드가 있는 폴더
|lib/	|iOS용 PLUG SDK 라이브러리 파일이 있는 폴더
|sample/external-lib	|외부 라이브러리 파일이 있는 폴더|
|sample/navercafesdk-sample-ios	|Xcode용 샘플 프로젝트가 있는 폴더|
|LICENSE 	|라이선스 파일|
|README.md	|리드미 파일|

## Dependent Libraries

- PLUG SDK를 사용하려면 다음 라이브러리를 프로젝트에 추가해 함께 빌드해야 합니다. 라이브러리는 샘플 프로젝트에 포함돼 있습니다.[네이버 아이디 로그인](https://nid.naver.com/devcenter/docs.nhn?menu=IOS)(4.0.7 버전)
- [AFNetworking](https://github.com/AFNetworking/AFNetworking)(3.1.0 버전 )
  - AFNetworking 2.x 버전과 3.x 버전 모두 사용할 수 있습니다. PLUG SDK 테스트는 AFNetworking 3.1.0 버전으로 진행했습니다.

- [SDWebImage](https://github.com/rs/SDWebImage)(3.8.2 버전)
- [FLAnimatedImage-](https://github.com/Flipboard/FLAnimatedImage)(1.0.12 버전)
- ApiGateway-1.5.0
- KaleidoCore.framework
  
## License 

PLUG SDK의 저작권은 네이버(주)에 있습니다.

```
NAVER Cafe SDK for iOS

Copyright 2015 NAVER Corp.
All rights reserved.

Unauthorized use, modification and redistribution of this software are strongly prohibited.
```

PLUG SDK 3.x 버전은 더 이상 지원되지 않습니다.

