//
//  UserSettingsTableViewController.m
//  Lendable
//
//  Created by Jonathan Mayhak on 8/25/12.
//
//

#import "UserSettingsTableViewController.h"
#import "Parse/Parse.h"
#import "DIYCategoriesTableViewController.h"

@interface UserSettingsTableViewController ()

@end

@implementation UserSettingsTableViewController
@synthesize emailText;
@synthesize phoneText;
@synthesize updateButton;
@synthesize statusText;
@synthesize logoutButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo-small.png"]];
        self.navigationItem.titleView = imageView;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFUser *user = [PFUser currentUser];
    
    emailText.text = [user objectForKey:@"email"];
    phoneText.text = [user objectForKey:@"phone"];
    statusText.text = @"";
            
    UIToolbar *toolbar = [[[UIToolbar alloc] init] autorelease];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resignKeyboard)];
    
    NSArray *itemsArray = [NSArray arrayWithObjects:flexButton, doneButton, nil];
    
    [flexButton release];
    [doneButton release];
    [toolbar setItems:itemsArray];
    
    [emailText setInputAccessoryView:toolbar];
    [phoneText setInputAccessoryView:toolbar];
    // Do any additional setup after loading the view from its nib.
}

-(void) resignKeyboard{
    [self.view endEditing:TRUE];
}

- (IBAction)update:(id)sender {
    PFUser *user = [PFUser currentUser];
        
    [user setObject:emailText.text forKey:@"email"];
    [user setObject:phoneText.text forKey:@"phone"];
    
    [user save];
    
    statusText.text = @"Updated!";
}

- (IBAction)logout:(id)sender {
    [PFUser logOut];
    
    if (![PFUser currentUser]) {
        // Create the log in view controller
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        [logInViewController setDelegate:self]; // Set ourselves as the delegate
        
        [logInViewController.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Login.png"]]];
        
        logInViewController.logInView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"just_background@2x.png"]];
        logInViewController.logInView.usernameField.backgroundColor = [UIColor blackColor];
        logInViewController.logInView.passwordField.backgroundColor = [UIColor blackColor];
        
        // Create the sign up view controller
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
        
        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
        
        [signUpViewController.signUpView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SignUp.png"]]];
        
        signUpViewController.signUpView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"just_background@2x.png"]];
        signUpViewController.signUpView.usernameField.backgroundColor = [UIColor blackColor];
        signUpViewController.signUpView.passwordField.backgroundColor = [UIColor blackColor];
        signUpViewController.signUpView.emailField.backgroundColor = [UIColor blackColor];
        signUpViewController.signUpView.additionalField.placeholder = @"Phone Number";
        signUpViewController.signUpView.additionalField.backgroundColor = [UIColor blackColor];
        
        // Assign our sign up controller to be displayed from the login controller
        [logInViewController setSignUpController:signUpViewController];
        
        // Present the log in view controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
    }
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissModalViewControllerAnimated:YES]; // Dismiss the PFSignUpViewController
}

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [self setEmailText:nil];
    [self setPhoneText:nil];
    [self setUpdateButton:nil];
    [self setStatusText:nil];
    [self setLogoutButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [emailText release];
    [phoneText release];
    [updateButton release];
    [statusText release];
    [logoutButton release];
    [super dealloc];
}
@end
