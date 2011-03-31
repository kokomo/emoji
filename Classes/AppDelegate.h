//
//  EmojiAppDelegate.h
//  Emoji
//
//  Created by Chris Gibbs on 9/23/10.
//  Copyright Meld Apps 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EmojiViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    EmojiViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EmojiViewController *viewController;

@end

