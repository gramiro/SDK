#import "AFIncrementalStore.h"
#import "AFRestClient.h"

@interface SDKTestAPIClient : AFRESTClient <AFIncrementalStoreHTTPClient>

+ (SDKTestAPIClient *)sharedClient;

@end
