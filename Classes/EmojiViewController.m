//
//  EmojiViewController.m
//  Emoji
//
//  Created by Chris Gibbs on 9/23/10.
//  Copyright Meld Apps 2010. All rights reserved.
//

#import "EmojiViewController.h"

#define ENABLED_TXT @"Emoji keyboard enabled"
#define DISABLED_TXT @"Emoji keyboard disabled"

#define PREFS_FILE	@"/private/var/mobile/Library/Preferences/com.apple.Preferences.plist"
#define EMOJI_KEY	@"KeyboardEmojiEverywhere"

@implementation EmojiViewController

@synthesize controlSwitch;
@synthesize statusLabel;



- (void) viewDidLoad
{
	if ([self isEmojiEnabled]) {
		[controlSwitch setOn:YES];
		[statusLabel setText:ENABLED_TXT];
	} else {
		[controlSwitch setOn:NO];
		[statusLabel setText:DISABLED_TXT];
	}
	
}

- (BOOL) isEmojiEnabled
{
	NSMutableDictionary *prefs = [self getPreferences];
	return [[prefs objectForKey:EMOJI_KEY] boolValue];
}



- (IBAction) didSwitchEmoji:(id)sender
{
	if ([controlSwitch isOn])
		[self enableEmoji];
	else
		[self disableEmoji];
}



- (void) enableEmoji
{
	NSMutableDictionary *prefs = [self getPreferences];
	[prefs setObject:[NSNumber numberWithBool:YES] forKey:EMOJI_KEY];
	[self setPreferences:prefs];
	[statusLabel setText:ENABLED_TXT];
}

- (void) disableEmoji
{
	NSMutableDictionary *prefs = [self getPreferences];
	[prefs removeObjectForKey:EMOJI_KEY];
	[self setPreferences:prefs];
	[statusLabel setText:DISABLED_TXT];
}



- (NSMutableDictionary *) getPreferences
{
	NSMutableDictionary *prefs = [NSMutableDictionary dictionaryWithContentsOfFile:PREFS_FILE];
	if (!prefs) {
		[statusLabel setText:@"Error loading preferences"];
		[controlSwitch setEnabled:NO];
	}
	return prefs;
}

- (void) setPreferences:(NSMutableDictionary *)prefs
{
	[prefs writeToFile:PREFS_FILE atomically:NO];
}


@end
