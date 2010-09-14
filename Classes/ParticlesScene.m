//
//  ParticlesScene.m
//  ReusableParticles
//
//  Created by Brandon Williams on 9/10/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import "ParticlesScene.h"


@implementation ParticlesScene

+(id) scene
{
	CCScene *scene = [CCScene node];
	ParticlesScene *layer = [ParticlesScene node];
	[scene addChild: layer];
	return scene;
}

-(id) init {
	if (! (self = [super init]))
		return nil;
	
	explosionDictionaries = [[NSArray alloc] initWithObjects:
							 [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ExplosionParticles1" ofType:@"plist"]],
							 [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ExplosionParticles2" ofType:@"plist"]],
							 [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ExplosionParticles3" ofType:@"plist"]],
							 nil];
	
	self.isTouchEnabled = YES;
	
	explosion = [[ARCH_OPTIMAL_PARTICLE_SYSTEM alloc] initWithTotalParticles:300];
	explosion.reuseParticles = YES;
	explosion.position = ccp(0.0f,0.0f);
	[self addChild:explosion];
	[explosion release];
	
	return self;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	static int i = 0;
	
	[explosion setAttributesWithDictionary:[explosionDictionaries objectAtIndex:(i++ % [explosionDictionaries count])] loadTexture:NO];
	
	for (UITouch *touch in touches) {
		CGPoint p = [[CCDirector sharedDirector] convertToGL:[touch locationInView:[touch view]]];
		explosion.centerOfGravity = p;
		[explosion spawnParticles:50];
	}
}

@end
