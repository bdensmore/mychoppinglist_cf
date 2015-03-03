component{
    // Default Action

    function index( event, rc, prc) {
        prc.welcomeMessage = "Welcome to ColdBox!";
        event.setView("main/index");
    }

    function validate( event, rc, prc ) {
        prc.errors = "";
        arrayEach( arguments.validation.getAllErrors(), function( e ) {
            prc.errors &= e & "<br>";
        });

        flash.put( "errors", prc.errors );

        setNextEvent( event = arguments.eventToRun, persist="user_id" );
    }

    function onAppInit( event, rc, prc ) {}

    function onRequestStart( event, rc, prc ) {}

    function onRequestEnd( event, rc, prc) {}

    function onSessionStart( event, rc, prc){}

    function onSessionEnd( event, rc, prc ) {
        var applicationScope = event.getValue("applicationReference");
        var sessionScope = event.getValue("sessionReference");
    }

    function onException( event, rc, prc ) {
        //Grab Exception From private request collection, placed by ColdBox Exception Handling
        var exception = prc.exception;
        //Place exception handler below:
    }

    function onMissingTemplate( event, rc, prc ) {
        //Grab missingTemplate From request collection, placed by ColdBox
        var missingTemplate = event.getValue("missingTemplate");
    }

}
