//
//  ParticlesScene.h
//  ReusableParticles
//
//  Created by Brandon Williams on 9/10/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ParticlesScene : CCLayer {

	ARCH_OPTIMAL_PARTICLE_SYSTEM *explosion;
	NSArray *explosionDictionaries;
}

+(CCScene*) scene;

@end
