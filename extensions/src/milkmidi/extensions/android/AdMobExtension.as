package  milkmidi.extensions.android {	
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	
	/**
	 * ...
	 * @author milkmidi
	 */
	
	public class AdMobExtension  {		 
		
		private static const EXTENSION_ID:String = "milkmidi.extensions.android.Admob";
		
		private static var _context:ExtensionContext;
		public static var eventDispatcher:EventDispatcher = new EventDispatcher();
		public static function init(publishId:String):* {			
			if ( _context == null) {
				_context = ExtensionContext.createExtensionContext( EXTENSION_ID, "" );						
				_context.addEventListener(StatusEvent.STATUS , statusHandler );
			}			
			return _context.call( "init" , publishId );						            
		}
		
		
		
		public static function destroy():void {
			_context.call( "destroy" );
		}
		
		public static function show(adSize:String = AdSize.BANNER , align:int = AdMobAlignment.ALIGN_PARENT_LEFT):void {				
			_context.call( "show" , adSize , align );						
		}
		
		static private function statusHandler(e:StatusEvent):void {
			eventDispatcher.dispatchEvent( e.clone() );
		}

		
    }

}

