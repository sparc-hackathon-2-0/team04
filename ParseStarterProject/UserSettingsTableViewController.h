//
//  UserSettingsTableViewController.h
//  Lendable
//
//  Created by Jonathan Mayhak on 8/25/12.
//
//

#import <UIKit/UIKit.h>

@interface UserSettingsTableViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *emailText;
@property (retain, nonatomic) IBOutlet UITextField *phoneText;
@property (retain, nonatomic) IBOutlet UIButton *updateButton;
@property (retain, nonatomic) IBOutlet UILabel *statusText;
@property (retain, nonatomic) IBOutlet UIButton *logoutButton;

@end
