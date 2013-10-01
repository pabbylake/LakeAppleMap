//
//  LakeAppleMapViewController.h
//  LakeAppleMap
//
//  Created by lake on 9/25/13.
//  Copyright (c) 2013 Lake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface LakeAppleMapViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *text;

@end
