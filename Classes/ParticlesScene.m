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

@end
