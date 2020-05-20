using Toybox.Application as App;

class AltitudeWidgetApp extends App.AppBase {
	hidden var AltView;
	hidden var Delegate;
	hidden var state;

    function initialize() {
        AppBase.initialize();
		state = new AltitudeViewState();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        AltView = new AltitudeWidgetView();
        AltView.mState = state;
        Delegate = new AltitudeWidgetDelegate();
        Delegate.mState = state;
        return [ AltView, Delegate ];
    }

(:glance)
    function getGlanceView() {
        return [ new AltitudeWidgetGlanceView() ];
    }

}