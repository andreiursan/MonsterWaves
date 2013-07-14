//
//  IntroLayer.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 2/27/13.
//  Copyright Andrei Ursan 2013. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "GameLayer.h"

#pragma mark - IntroLayer

@implementation IntroLayer

+ (CCScene *)scene {
	CCScene *scene = [CCScene node];
	IntroLayer *layer = [IntroLayer node];
	[scene addChild: layer];
	return scene;
}

- (id)init {
  self = [super init];
	if(self) {
		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
			_background = [CCSprite spriteWithFile:@"Default.png"];
			_background.rotation = 90;
		} else {
			_background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
		}
		_background.position = kWinCenter;
		[self addChild: _background];
  }
  return self;
}

- (void)onEnter
{
	[super onEnter];
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameLayer scene] ]];
}

@end
