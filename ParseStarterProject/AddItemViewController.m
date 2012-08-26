//
//  AddItemViewController.m
//  Lendable
//
//  Created by Jason Rikard on 8/25/12.
//
//

#import "AddItemViewController.h"

@interface AddItemViewController ()
@property (retain, nonatomic) IBOutlet UITextField *aTextField;

@end

@implementation AddItemViewController
@synthesize submitButton;
@synthesize descriptionTextField;
@synthesize aTextField;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    descriptionTextField.layer.cornerRadius = 5;
//    descriptionTextField.clipsToBounds = YES;
    
    [descriptionTextField.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]]; [descriptionTextField.layer setBorderWidth:2.0];
    
    UIToolbar *toolbar = [[[UIToolbar alloc] init] autorelease];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resignKeyboard)];
    
    NSArray *itemsArray = [NSArray arrayWithObjects:flexButton, doneButton, nil];
    
    [flexButton release];
    [doneButton release];
    [toolbar setItems:itemsArray];
    
    [aTextField setInputAccessoryView:toolbar];
    [descriptionTextField setInputAccessoryView:toolbar];
    // Do any additional setup after loading the view from its nib.
}

-(void) resignKeyboard{
    [self.view endEditing:TRUE];
}
- (IBAction)submitButtonPressed2:(id)sender {
    PFUser *user = [PFUser currentUser];
    PFObject *newSupplies = [PFObject objectWithClassName:@"Supplies"];
    
    [newSupplies setObject:aTextField.text forKey:@"title"];
    [newSupplies setObject:descriptionTextField.text forKey:@"description"];
    [newSupplies setObject:user forKey: @"created_by"];
    
    PFACL *postACL = [PFACL ACLWithUser:user];
    [postACL setPublicReadAccess:YES];
    newSupplies.ACL = postACL;
    
    [newSupplies saveInBackground];
    
        [delegate SuppliesAdded];
    
    
    [self dismissModalViewControllerAnimated:YES];
}



- (void)viewDidUnload
{
    [self setATextField:nil];
    [self setDescriptionTextField:nil];
    [self setSubmitButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)cancel:(id)sender
{
    // This message gets forwarded to the parentViewController
    [self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
    [aTextField release];
    [descriptionTextField release];
    [submitButton release];
    [super dealloc];
}
@end
