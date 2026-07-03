// ProximityDisabler.xm
#import <UIKit/UIKit.h>
#import <substrate.h>

%hook UIDevice

- (BOOL)proximityMonitoringEnabled {
    // 如果是通话相关，强制返回 NO（远离状态）
    return NO;
}

- (void)setProximityMonitoringEnabled:(BOOL)enabled {
    // 阻止启用 proximity monitoring
    %orig(NO);
}

- (void)proximityStateDidChange {
    // 阻止状态变化导致灭屏
    %orig;
}

%end

// 针对通话通知的额外 hook（可选加强）
%hook UIApplication
- (void)beginReceivingRemoteControlEvents {
    %orig;
}
%end

// 日志（调试用）
%ctor {
    NSLog(@"[ProximityDisabler] Loaded for third-party call app!");
}
