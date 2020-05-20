using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Position as Pos;

class AltitudeWidgetDelegate extends Ui.BehaviorDelegate {
    /* Initialize and get a reference to the view, so that
     * user iterations can call methods in the main view. */
// Not needed in this case
	var mState;
     
    function initialize() {
        Ui.BehaviorDelegate.initialize();
    }

    function onSelect() {
		Sys.println("Select");
        // force a redraw
        Ui.requestUpdate();
        return true;
    }

    /* Menu button press. */
    function onMenu() {
		Sys.println("Menu");
		
		mState.mSubTitle = "Acquiring GPS...";
		Pos.enableLocationEvents(Pos.LOCATION_ONE_SHOT, self.method(:onPosition));
		Ui.requestUpdate();
		
        return true;
    }
    
    function onPosition(info) {
    	Sys.println("Position acquired");
    	Sys.println(info.accuracy);
    	mState.mSubTitle = null;
    	
    	Ui.requestUpdate();
    }
}
