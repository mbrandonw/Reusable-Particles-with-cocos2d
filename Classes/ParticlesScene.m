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
	
	explosion = [[ARCH_OPTIMAL_PARTICLE_SYSTEM alloc] initWithFile:@"ExplosionParticles.plist"];
	explosion.reuseParticles = YES;
	explosion.position = ccp(0.0f,0.0f);
	[self addChild:explosion];
	[explosion release];
	
	return self;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[explosion setAttributesWithDictionary:[explosionDictionaries objectAtIndex:(arc4random()%3)] loadTexture:NO];
	
	UITouch *touch = [touches anyObject];
	explosion.centerOfGravity = [[CCDirector sharedDirector] convertToGL:[touch locationInView:[touch view]]];
	[explosion spawnParticles:100];
}

@end
