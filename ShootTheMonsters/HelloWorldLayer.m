//
//  HelloWorldLayer.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 2/27/13.
//  Copyright Andrei Ursan 2013. All rights reserved.
//


#import "HelloWorldLayer.h"
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer


@implementation HelloWorldLayer


+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	HelloWorldLayer *layer = [HelloWorldLayer node];
	[scene addChild: layer];
	
	return scene;
}

-(id) init
{
	if( (self=[super initWithColor:ccc4(255,255,255,255)]) ) {
    player = [CCSprite spriteWithFile:@"player.png"];
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    player.position = ccp(player.contentSize.width/2, winSize.height/2);
    [self addChild: player];
	}
	return self;
}


- (void) dealloc
{
	[super dealloc];
}

@end
