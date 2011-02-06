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
	
	// a couple of preloaded particle system parameter dictionaries (these were made with Particle Designer)
	explosionDictionaries = [[NSArray alloc] initWithObjects:
							 [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ExplosionParticles1" ofType:@"plist"]],
							 [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ExplosionParticles2" ofType:@"plist"]],
							 [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ExplosionParticles3" ofType:@"plist"]],
							 nil];
	
	self.isTouchEnabled = YES;
	
	// create one big reusable particle system
	explosion = [[ARCH_OPTIMAL_PARTICLE_SYSTEM alloc] initWithTotalParticles:500];
	explosion.reuseParticles = YES;
	explosion.position = ccp(0.0f,0.0f);
	[self addChild:explosion];
	
	[self scheduleUpdate];
	
	return self;
}

-(void) update:(ccTime)dt {
	
	explosion.sourcePosition = ccp(100.0f, 100.0f);
	[explosion setAttributesWithDictionary:[explosionDictionaries lastObject] loadTexture:NO];
	[explosion spawnParticles:3];
	
	explosion.sourcePosition = ccp(400.0f, 250.0f);
	[explosion setAttributesWithDictionary:[explosionDictionaries objectAtIndex:0] loadTexture:NO];
	[explosion spawnParticles:3];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	static int i = 0;
	
	// change the parameters of the particle system using one of the preloaded dictionaries
	[explosion setAttributesWithDictionary:[explosionDictionaries objectAtIndex:(i++ % [explosionDictionaries count])] 
							   loadTexture:NO];
	
	// start an explosion for each touch
	for (UITouch *touch in touches)
	{
		CGPoint p = [[CCDirector sharedDirector] convertToGL:[touch locationInView:[touch view]]];
		explosion.sourcePosition = p;
		[explosion spawnParticles:50];
	}
}

-(void) dealloc {
	
	[explosion release];
	
	[super dealloc];
}

@end
