//
//  DIYTabViewController.m
//  ParseStarterProject
//
//  Created by Jonathan Mayhak on 8/25/12.
//
//

#import "DIYTabViewController.h"
#import "Parse/Parse.h"

@interface DIYTabViewController ()

@end

@implementation DIYTabViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
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
        
        // Assign our sign up controller to be displayed from the login controller
        [logInViewController setSignUpController:signUpViewController];
        
        // Present the log in view controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
    }
    
    [super viewDidAppear:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
