//
//  ReusableParticlesAppDelegate.m
//  ReusableParticles
//
//  Created by Brandon Williams on 9/10/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import "ReusableParticlesAppDelegate.h"
#import "ParticlesScene.h"

@implementation ReusableParticlesAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	CC_DIRECTOR_INIT();
	
	CCDirector *director = [CCDirector sharedDirector];
	[director setDeviceOrientation:kCCDeviceOrientationLandscapeLeft];
	[director setDisplayFPS:YES];
	
	EAGLView *view = [director openGLView];
	[view setMultipleTouchEnabled:YES];
	
	[CCTexture2D setDefaultAlphaPixelFormat:kTexture2DPixelFormat_RGBA8888];	
	[[CCDirector sharedDirector] runWithScene:[ParticlesScene scene]];
	
    return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
