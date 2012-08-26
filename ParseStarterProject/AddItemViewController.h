//
//  AddItemViewController.h
//  Lendable
//
//  Created by Jason Rikard on 8/25/12.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <Parse/Parse.h>
#import "AddItemViewController.h"

@protocol AddSuppliesDelegate
@optional
-(void)SuppliesAdded;

@end

@interface AddItemViewController : UIViewController{
    
    id < AddSuppliesDelegate > delegate;
    
}
@property(nonatomic,assign)id delegate;
@property (retain, nonatomic) IBOutlet UITextView *descriptionTextField;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) UITextField *activeField;
@property (retain, nonatomic) IBOutlet UIButton *submitButton;

@end
