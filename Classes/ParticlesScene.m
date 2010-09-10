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
	
	self.isTouchEnabled = YES;
	
	CCParticleExplosion *explosion = [[CCParticleExplosion alloc] initWithTotalParticles:100];
	explosion.autoRemoveOnFinish = YES;
	[self addChild:explosion];
	[explosion release];
	
	return self;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"!?!?");
}

@end
