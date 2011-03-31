//
//  EmojiViewController.h
//  Emoji
//
//  Created by Chris Gibbs on 9/23/10.
//  Copyright Meld Apps 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmojiViewController : UIViewController {
	UISwitch *controlSwitch;
	UILabel *statusLabel;
}

@property (nonatomic, retain) IBOutlet UISwitch *controlSwitch;
@property (nonatomic, retain) IBOutlet UILabel *statusLabel;

- (BOOL) isEmojiEnabled;

- (IBAction) didSwitchEmoji:(id)sender;

- (void) enableEmoji;
- (void) disableEmoji;

- (NSMutableDictionary *) getPreferences;
- (void) setPreferences:(NSMutableDictionary *)prefs;

@end

