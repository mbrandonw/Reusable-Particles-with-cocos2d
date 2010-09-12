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
	
	explosion = [[ARCH_OPTIMAL_PARTICLE_SYSTEM alloc] initWithFile:@"ExplosionParticles1.plist"];
	explosion.reuseParticles = YES;
	explosion.position = ccp(0.0f,0.0f);
	[self addChild:explosion];
	[explosion release];
	
	return self;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	static int i = -1;
	i++;
	
	[explosion setAttributesWithDictionary:[explosionDictionaries objectAtIndex:(i%3)] loadTexture:NO];
	explosion.position = ccp(0.0f,0.0f);
	
	UITouch *touch = [touches anyObject];
	CGPoint p = [[CCDirector sharedDirector] convertToGL:[touch locationInView:[touch view]]];
	explosion.centerOfGravity = p;
	[explosion spawnParticles:100];
}

@end
